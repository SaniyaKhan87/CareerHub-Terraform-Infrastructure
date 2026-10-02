variable "ami_id" {
  description = "AMI ID for the CareerHub EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for CareerHub"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the CareerHub EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the CareerHub EC2 instance"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name for the CareerHub EC2 instance"
  type        = string
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}
