output "instance_id" {
  description = "ID of the CareerHub EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP of the CareerHub EC2 instance"
  value       = aws_instance.this.public_ip
}

output "elastic_ip" {
  description = "Elastic IP of the CareerHub EC2 instance"
  value       = aws_eip.this.public_ip
}
