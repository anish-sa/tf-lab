resource "aws_s3_bucket" "server_bucket"{
    bucket = var.bucket_name
    force_destroy = true
}