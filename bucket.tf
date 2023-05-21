resource "aws_s3_bucket" "my-de-bucket" {
  bucket = "my-de-bucket-2023"
  tags = {
    Name = "${var.env_prefix}-de-bucket"
  }
}

resource "aws_s3_bucket_acl" "my-de-bucket-acl" {
  bucket = aws_s3_bucket.my-de-bucket.id
  acl    = "private"
  depends_on = [aws_s3_bucket_ownership_controls.my_de_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "my_de_bucket_acl_ownership" {
  bucket = aws_s3_bucket.my-de-bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
} 