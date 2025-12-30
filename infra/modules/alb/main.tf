resource "aws_alb" "main" {
    name        = "threatcomp-load-balancer"
    subnets = var.public_subnet_ids
    security_groups = [var.alb_sg_id]
}


resource "aws_alb_target_group" "app" {
    name        = "threatcomp-target-group"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = var.vpc_id
    target_type = "ip"

    health_check {
        healthy_threshold   = "3"
        interval            = "60"
        protocol            = "HTTP"
        matcher             = "200"
        timeout             = "3"
        path                = var.health_check_path
        unhealthy_threshold = "2"
    }
}


resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_alb.main.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.app.arn
  }
} 