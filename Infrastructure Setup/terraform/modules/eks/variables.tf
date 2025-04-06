# modules/eks/variables.tf

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS node groups"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Whether the EKS cluster API server is publicly accessible"
  type        = bool
  default     = true
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "vpc_cni_version" {
  description = "Version of VPC CNI addon"
  type        = string
  default     = "v1.12.6-eksbuild.2"  # Use appropriate version
}

variable "coredns_version" {
  description = "Version of CoreDNS addon"
  type        = string
  default     = "v1.9.3-eksbuild.3"  # Use appropriate version
}

variable "kube_proxy_version" {
  description = "Version of kube-proxy addon"
  type        = string
  default     = "v1.27.1-eksbuild.1"  # Use appropriate version
}

variable "cluster_role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the IAM role for the EKS nodes"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
