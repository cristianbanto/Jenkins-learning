provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0905a3c97561e0b69"  
  instance_type = "t2.micro"
  tags = {
    Name = "test-vm"
  }
}

resource "aws_iam_role" "test-role" {
  name               = "test_role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-terraformtf-test-bucket-cristian-${var.aws_region}"
  tags = {
    Name        = "test-bucket"
    Environment = "Dev"
  }
}