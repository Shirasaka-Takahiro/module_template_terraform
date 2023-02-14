output "efs_id" {
  value = aws_efs_file_system.default_file_system.id
}

output "efs_dns_name" {
  value = aws_efs_file_system.default_file_system.dns_name
}