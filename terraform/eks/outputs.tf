# eks/outputs.tf

output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.example.id
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.example.endpoint
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.example.name
}

output "eks_node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.example.node_group_name
}

output "eks_node_instance_types" {
  description = "The instance types of the EKS node group"
  value       = aws_eks_node_group.example.instance_types
}

output "eks_node_group_resources" {
  description = "The resources associated with the EKS node group"
  value       = aws_eks_node_group.example.resources
}
