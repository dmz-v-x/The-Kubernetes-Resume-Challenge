# terraform {
#   backend "s3" {
#     bucket         = "eks-terrafrom-kubernetes-resume-challenge"
#     region         = "ap-south-1"
#     key            = "eks/terraform.tfstate"
#     dynamodb_table = "terraform-state-lock-kubernetes-resume-challenge"
#     encrypt        = true
#   }
# }
