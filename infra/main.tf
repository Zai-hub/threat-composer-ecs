# Root for Networking

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
  az_count = var.az_count
}

# Root for Security

module "security" {
  source   = "./modules/security"
  vpc_id   = module.networking.vpc_id
  app_port = 80
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = "threat-composer-image"
}