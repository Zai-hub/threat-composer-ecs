module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
  az_count = var.az_count
}


module "security" {
  source   = "./modules/security"
  vpc_id   = module.networking.vpc_id
  app_port = 80
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = "threat-composer-image"
}


module "ecs" {
  source = "./modules/ecs"

  aws_region = var.aws_region

  app_image = "${module.ecr.repository_url}:latest"
  app_port  = 80

  app_count       = 2
  fargate_cpu     = 256
  fargate_memory  = 512

  private_subnet_ids = module.networking.private_subnet_ids
  ecs_tasks_sg_id    = module.security.ecs_tasks_sg_id

  target_group_arn = module.alb.target_group_arn
  listener_arn = module.alb.listener_https_arn
}


module "alb" {
  source = "./modules/alb"

  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id

  app_port           = 80
  health_check_path  = "/health"

  certificate_arn = module.acm.certificate_arn
}

# ACM
module "acm" {
  source      = "./modules/acm"
  domain_name = var.domain_name
}