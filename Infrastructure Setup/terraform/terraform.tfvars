# terraform/terraform.tfvars
aws_region = "ap-south-1"
cluster_name = "my-eks-cluster"
cluster_version = "1.28"
vpc_cidr = "10.0.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24"]

# Changed from instance_types to node_group_instance_types
node_group_instance_types = ["t3.medium"]

# Changed from desired_size to node_group_desired_size
node_group_desired_size = 2

# Changed from max_size to node_group_max_size
node_group_max_size = 4

# Changed from min_size to node_group_min_size
node_group_min_size = 1

tags = {
  Environment = "prod"
  Terraform   = "true"
}

