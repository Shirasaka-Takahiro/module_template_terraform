##Provider for ap-northeast-1
provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

##Provider for us-east-1
provider "aws" {
  profile = "terraform-user"
  alias   = "us-east-1"
  region  = var.regions["virginia"]
}

##Network
module "network" {
  source = "../../module/network"

  general_config     = var.general_config
  regions            = var.regions
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

##Security Group
module "securitygroup" {
  source = "../../module/securitygroup"

  general_config     = var.general_config
  vpc_id = module.network.vpc_id
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  cidr_blocks = var.cidr_blocks
}