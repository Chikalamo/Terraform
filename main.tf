# Terraform

provider "aws" {
  region = "eu-west-2"
}

 resource "aws_s3_bucket" "ruth-bucket" {
   bucket = "ruth-azubi-assignment-bucket"
}

module "s3_user" {
  source = "cloudposse/iam-s3-user/aws"
  version = "1.2.0"
  name = "azubi-ruth"
  s3_actions = ["s3:GetObject","s3:PutObject"]
  s3_resources = ["arn:aws:s3:::ruth-azubi-assignment-bucket/*"]
}