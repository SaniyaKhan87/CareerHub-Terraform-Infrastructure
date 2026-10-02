module "vpc" {
  source = "./modules/vpc"

  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
  root_volume_size  = var.root_volume_size
}

module "s3" {
  source = "./modules/s3"

  bucket_prefix = var.bucket_prefix
}
