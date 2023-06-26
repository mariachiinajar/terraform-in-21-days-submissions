data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.env_code
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.public_subnet_cidr 
  public_subnets  = var.private_subnet_cidr

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env_code
  }
}

output test {
  value = data.aws_availability_zones.available.names
}

