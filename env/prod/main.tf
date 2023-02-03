##Provider for ap-northeast-1
provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

##Network
module "network" {
  source = "../../module/network"

  general_config      = var.general_config
  regions             = var.regions
  availability_zones  = var.availability_zones
  vpc_id              = "" #Input stg's vpc_id
  vpc_cidr            = var.vpc_cidr
  internet_gateway_id = "" #Input stg's internet_gateway_id
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
}

##Security Group Internal
#module "internal_sg" {
#  source = "../../module/securitygroup"

#  general_config = var.general_config
#  vpc_id         = module.network.vpc_id
#  from_port      = 0
#  to_port        = 0
#  protocol       = "-1"
#  cidr_blocks    = module.network.vpc_cidrblock
#  sg_role        = "internal"
#}