# aws/main.tf

variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

resource "aws_instance" "example" {
  ami           = "ami-075686beab831bb7f"  # Example AMI ID for Amazon Linux 2
  instance_type = var.instance_type

  tags = {
    Name = "tree-leaf-instance"
  }
}


