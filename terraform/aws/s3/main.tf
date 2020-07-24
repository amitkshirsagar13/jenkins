resource "aws_s3_bucket" "demo-bucket" {
    bucket = "k8cluster-demo-bucket"
    acl    = "private"
    region = "us-east-1"

    tags = {
    Name        = "k8cluster Demo Bucket"
    Environment = "Dev"
    }
}

resource "aws_s3_bucket_object" "file_upload" {
  bucket = aws_s3_bucket.demo-bucket.bucket
  key    = "me.txt"
  source = "me.txt"
  etag   = "${filemd5("me.txt")}"
}

output "bucket_arn" {
  value = aws_s3_bucket.demo-bucket.arn
}