variable "regions" {}
variable "zone_id" {}
variable "domain_name" {}
variable "sans" {}
provider "aws" {
  alias  = "us-east-1"
  region = var.regions["virginia"]
}