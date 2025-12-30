output "alb_sg_id" {
  value = aws_security_group.lb.id
}

output "ecs_tasks_sg_id" {
  value = aws_security_group.ecs_tasks.id
}