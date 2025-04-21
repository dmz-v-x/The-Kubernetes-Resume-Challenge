# terraform {
#   backend "s3" {
#     bucket         = "eks-terraform-kubernetes-resume-challenge"
#     region         = "us-east-1"
#     key            = "eks/terraform.tfstate"
#     dynamodb_table = "value"
#     encrypt        = true
#   }
# }
