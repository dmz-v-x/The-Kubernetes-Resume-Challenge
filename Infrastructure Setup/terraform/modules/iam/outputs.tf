output "cluster_iam_role_name" {
  description = "Name of the EKS cluster IAM role"
  value       = aws_iam_role.cluster.name
}

output "cluster_iam_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.cluster.arn
}

output "node_group_iam_role_name" {
  description = "Name of the EKS node group IAM role"
  value       = aws_iam_role.node_group.name
}

output "node_group_iam_role_arn" {
  description = "ARN of the EKS node group IAM role"
  value       = aws_iam_role.node_group.arn
}
