data "terraform_remote_state" "level1" {
  backend = "s3"

  config = {
    bucket = "terraform-revision"
    key    = "level1-revision.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "amazonlinux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

