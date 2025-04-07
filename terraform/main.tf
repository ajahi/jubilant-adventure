# main.tf

module "aws" {
  source         = "./aws"
  aws_region     = var.aws_region
  instance_type  = var.instance_type
}

