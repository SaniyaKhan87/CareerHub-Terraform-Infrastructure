output "vpc_id" {
  description = "ID of the CareerHub VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the CareerHub subnet"
  value       = module.vpc.subnet_id
}

output "security_group_id" {
  description = "ID of the CareerHub security group"
  value       = module.security_group.security_group_id
}

output "ec2_instance_id" {
  description = "ID of the CareerHub EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the CareerHub EC2 instance"
  value       = module.ec2.public_ip
}

output "elastic_ip" {
  description = "Elastic IP assigned to CareerHub EC2"
  value       = module.ec2.elastic_ip
}

output "s3_bucket_name" {
  description = "Name of the CareerHub S3 bucket"
  value       = module.s3.bucket_name
}
