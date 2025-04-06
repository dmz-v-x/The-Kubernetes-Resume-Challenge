terraform {
  backend "s3" {
    bucket         = "kubernetes-infra-terrafrom-backend"
    key            = "eks-cluster/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
