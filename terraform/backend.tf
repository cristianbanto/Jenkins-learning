# backend.tf

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-cristi"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
