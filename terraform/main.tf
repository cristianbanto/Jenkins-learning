provider "aws" {
  region = var.aws_region

}

resource "aws_instance" "test_instance" {
  ami           = "ami-0c7217cdde317cfec"  
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
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "test-bucket"
    Environment = "Dev"
  }
}