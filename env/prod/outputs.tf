output "vpc_id" {
  value = module.network.vpc_id
}

output "internet_gateway_id" {
  value = module.network.internet_gateway_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}