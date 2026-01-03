terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "jenkins-server-terraform-state-744861799534"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jenkins-server-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
