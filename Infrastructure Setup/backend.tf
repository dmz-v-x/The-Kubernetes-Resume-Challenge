terraform {
  backend "s3" {
    bucket         = "eks-terraform-kubernetes-resume-challenge"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-kubernetes-resume-challenge"
    encrypt        = true
  }
}
