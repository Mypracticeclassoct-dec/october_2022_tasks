# Here we provide the terraform provider for the aws cloud.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # the "~>4.0" means the provider version should be greater than 4.0 version.
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region  # here variable defines by the name "region"
}