variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "desired_nodes" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "max_nodes" {
  description = "The maximum number of worker nodes"
  type        = number
}

variable "min_nodes" {
  description = "The minimum number of worker nodes"
  type        = number
}

resource "aws_eks_cluster" "example" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      "subnet-09ff86128d894d3a5",
      "subnet-0da4f9f07950b43eb",
      "subnet-0b408449e351d2191",
      "subnet-0413b9d5586b2b8ea"
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_policy]
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = [
    "subnet-09ff86128d894d3a5",
    "subnet-0da4f9f07950b43eb",
    "subnet-0b408449e351d2191",
    "subnet-0413b9d5586b2b8ea"
  ]
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = var.desired_nodes
    max_size     = var.max_nodes
    min_size     = var.min_nodes
  }

  depends_on = [aws_eks_cluster.example]
}

resource "aws_iam_role" "eks_role" {
  name = "eks_cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "node_role" {
  name = "eks_node_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
