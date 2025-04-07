# main.tf

module "aws" {
  source         = "./aws"
  aws_region     = var.aws_region
  instance_type  = var.instance_type
}

module "eks" {
  source         = "./eks"
  aws_region     = var.aws_region
  cluster_name   = var.cluster_name
  node_group_name = var.node_group_name
  desired_nodes  = var.desired_nodes
  max_nodes      = var.max_nodes
  min_nodes      = var.min_nodes
}