variable "zone_id" {}
variable "domain_name" {}
variable "sans" {}
variable "alb_dns_name" {}
variable "alb_zone_id" {}
variable "regions" {}
provider "aws" {
  alias  = "us-east-1"
  region = var.regions
}