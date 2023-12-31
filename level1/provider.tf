terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "terraform-revision"
    key            = "level1-revision.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-revision"
  }
}

provider "aws" {
  region = "us-east-1"
}

