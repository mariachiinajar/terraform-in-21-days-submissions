terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "terraform-remote-state-for-pr"
    key            = "level1.tfstate"
    region         = "us-east-1"
    dynamodb_table = "remote-state-PR"
  }
}

provider "aws" {
  region = "us-east-1"
}

