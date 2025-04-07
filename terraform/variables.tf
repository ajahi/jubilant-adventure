# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of instance to use for AWS"
  default     = "t2.micro"
}

# variable "gcp_region" {
#   description = "The GCP region to deploy to"
#   default     = "us-central1"
# }

# variable "gcp_project" {
#   description = "The GCP project ID"
# }


# variable "machine_type" {
#   description = "The type of machine to use for GCP"
#   default     = "f1-micro"
# }

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "tree-leaf-cluster"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  default     = "tree-leaf-nodes"
}

variable "desired_nodes" {
  description = "The desired number of worker nodes"
  default     = 1
}

variable "max_nodes" {
  description = "The maximum number of worker nodes"
  default     = 1
}

variable "min_nodes" {
  description = "The minimum number of worker nodes"
  default     = 1
}