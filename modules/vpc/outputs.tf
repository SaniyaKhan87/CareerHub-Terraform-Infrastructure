output "vpc_id" {
  description = "ID of the CareerHub VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID of the CareerHub subnet"
  value       = aws_subnet.this.id
}
