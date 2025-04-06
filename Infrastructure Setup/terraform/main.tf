# terraform/main.tf

module "eks" {
  source = "./modules/eks"
  
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  
  endpoint_public_access = var.endpoint_public_access
  
  # Node group configuration
  node_group_desired_size = var.node_group_desired_size
  node_group_max_size     = var.node_group_max_size
  node_group_min_size     = var.node_group_min_size
  node_group_instance_types = var.node_group_instance_types
  
  # Add-on versions
  vpc_cni_version    = var.vpc_cni_version
  coredns_version    = var.coredns_version
  kube_proxy_version = var.kube_proxy_version
  
  # IAM roles
  cluster_role_arn = module.iam.cluster_iam_role_arn
  node_role_arn    = module.iam.node_group_iam_role_arn
  
  tags = var.tags
}
