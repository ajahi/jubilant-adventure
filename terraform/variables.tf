# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-west-2"
}

# variable "gcp_region" {
#   description = "The GCP region to deploy to"
#   default     = "us-central1"
# }

# variable "gcp_project" {
#   description = "The GCP project ID"
# }

variable "instance_type" {
  description = "The type of instance to use for AWS"
  default     = "t2.micro"
}

# variable "machine_type" {
#   description = "The type of machine to use for GCP"
#   default     = "f1-micro"
# }

