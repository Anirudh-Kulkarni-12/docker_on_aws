terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-2"
}
/*
module "vpc_module" {
  source     = "./vpc"
  cidr_block = "10.0.0.0/16"
}
*/
module "ec2_module" {
  source        = "./ec2"
  instance_type = "t3.micro"
}


