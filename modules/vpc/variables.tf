variable "vpc_cidr" {
  description = "CIDR block for CareerHub VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for CareerHub subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for CareerHub subnet"
  type        = string
}
