terraform {
  backend "s3" {
    bucket         = "eks-terraform-kubernetes-resume-challenge"
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    use_lockfile = "terraform-state-lock-kubernetes-resume-challenge"
    encrypt        = true
  }
}
