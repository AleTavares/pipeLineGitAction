terraform {
  required_version = " >= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner      = "tavares"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "353818015911-remotestate"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
