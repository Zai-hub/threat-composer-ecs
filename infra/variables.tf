variable "vpc_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "az_count" {
  type = number
  default = "2"
}

variable "aws_region" {
  type = string
  default = "eu-west-2"
}

variable "domain_name" {
  type = string
  default = "tm.zaitech.uk"
  }