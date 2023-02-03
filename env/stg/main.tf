##Provider for ap-northeast-1
provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

##Network
module "network" {
  source = "../../module/network"

  general_config     = var.general_config
  regions            = var.regions
  availability_zones = var.availability_zones
  vpc_id             = module.network.vpc_id
  vpc_cidr           = var.vpc_cidr
  internet_gateway_id = module.network.internet_gateway_id
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

##Security Group Internal
module "internal_sg" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id         = module.network.vpc_id
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_blocks    = module.network.vpc_cidrblock
  sg_role        = "internal"
}

##Secutiry Group Operation
module "operation_sg_1" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id = module.network.vpc_id
  from_port      = 22
  to_port        = 22
  protocol       = "tcp"
  cidr_blocks    = var.operation_sg_source_ip_1
  sg_role        = "operation"
}

module "operation_sg_2" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id = module.network.vpc_id
  from_port      = 22
  to_port        = 22
  protocol       = "tcp"
  cidr_blocks    = var.operation_sg_source_ip_2
  sg_role        = "operation"
}

module "operation_sg_3" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id = module.network.vpc_id
  from_port      = 22
  to_port        = 22
  protocol       = "tcp"
  cidr_blocks    = var.operation_sg_source_ip_3
  sg_role        = "operation"
}

##Secutiry Group ALB HTTP
module "operation_alb_http" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id = module.network.vpc_id
  from_port      = 80
  to_port        = 80
  protocol       = "tcp"
  cidr_blocks    = ["0.0.0.0/0"]
  sg_role        = "alb"
}

##Secutiry Group ALB HTTPS
module "operation_alb_https" {
  source = "../../module/securitygroup"

  general_config = var.general_config
  vpc_id = module.network.vpc_id
  from_port      = 443
  to_port        = 443
  protocol       = "tcp"
  cidr_blocks    = ["0.0.0.0/0"]
  sg_role        = "alb"
}