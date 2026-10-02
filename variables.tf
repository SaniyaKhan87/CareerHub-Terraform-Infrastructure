variable "aws_region" {
  description = "AWS region for CareerHub infrastructure"
  type        = string
  default     = "ap-southeast-2"
}

variable "vpc_cidr" {
  description = "CIDR block for CareerHub VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for CareerHub subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for CareerHub subnet"
  type        = string
  default     = "ap-southeast-2a"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for CareerHub EC2"
  type        = string
  default     = "ami-06259b63260eddc13"
}

variable "instance_type" {
  description = "EC2 instance type for CareerHub"
  type        = string
  default     = "c7i-flex.large"
}

variable "key_name" {
  description = "AWS key pair name for CareerHub EC2"
  type        = string
  default     = "CareerHub-Terraform"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 30
}

variable "bucket_prefix" {
  description = "Prefix for the CareerHub S3 bucket"
  type        = string
  default     = "careerhub-"
}
