variable "aws_region" {
  type = string 
  }

variable "app_image" {
  type = string 
  }

variable "app_port"  { 
  type = number 
  }

variable "app_count" {
  type    = number
  default = 2
}

variable "fargate_cpu"    {
  type = number 
  }

variable "fargate_memory" {
  type = number 
  }

variable "private_subnet_ids" {
  type = list(string)
}

variable "ecs_tasks_sg_id" {
  type = string
}

variable "target_group_arn" { 
  type = string
}

variable "listener_arn"     {
  type = string 
}