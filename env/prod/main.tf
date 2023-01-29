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
  public_subnet_ids  = module.dev.public_subnet_ids
  private_subnet_ids = module.dev.private_subnet_ids
}