terraform {
  backend "s3" {
    bucket = "8586-terraform-state"
    key = "426857564226/anish.tfstate"
    region = "us-east-1"
  }
}