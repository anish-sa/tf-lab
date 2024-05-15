provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      project   = "intern"
      silo      = "intern"
      terraform = "true"
      owner     = "anish.sapkota"
    }
  }
}