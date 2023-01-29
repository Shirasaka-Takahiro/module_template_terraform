variable "general_config" {
  type = map(any)
}
variable "vpc_id" {}
variable "to_port" {}
variable "from_port" {}
variable "protocol" {}
variable "cidr_blocks" {}
variable "sg_role" {}