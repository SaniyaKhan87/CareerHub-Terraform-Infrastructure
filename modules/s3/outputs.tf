output "bucket_name" {
  description = "Name of the CareerHub S3 bucket"
  value       = aws_s3_bucket.this.id
}
