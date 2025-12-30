# Networking
output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

# Security
output "alb_sg_id" { 
  value = module.security.alb_sg_id
  }

output "ecs_tasks_sg_id" {
  value = module.security.ecs_tasks_sg_id
  }

# ECR 
output "ecr_repository_url" {
  value = module.ecr.repository_url
}