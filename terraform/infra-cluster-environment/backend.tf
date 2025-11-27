
terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket"   # change
    key            = "eks/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
}
