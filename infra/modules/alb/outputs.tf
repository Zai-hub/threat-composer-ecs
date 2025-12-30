output "target_group_arn" {
  value = aws_alb_target_group.app.arn
}

output "listener_https_arn" {
  value = aws_alb_listener.https.arn
}

output "alb_dns_name" {
  value = aws_alb.main.dns_name
}

output "alb_zone_id" {
  value = aws_alb.main.zone_id
}
