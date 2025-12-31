variable "vpc_cidr" {
  type = string
}

variable "az_count" {
  type = number
}

variable "aws_region" {
  type = string
  default = "eu-west-2"
}

variable "domain_name" {
  type = string 
  }