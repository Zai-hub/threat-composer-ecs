terraform {
  backend "s3" {
    bucket         = "threat-composer-s3"
    key            = "threatcomp/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "threat-composer-dynamo"
    encrypt        = true
  }
}