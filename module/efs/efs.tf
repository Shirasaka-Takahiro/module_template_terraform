##File System
resource "aws_efs_file_system" "default_file_system" {
  encrypted                       = "true"
  provisioned_throughput_in_mibps = "100"
  throughput_mode                 = "provisioned"

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-efs-filesystem"
  }
}

##Mount Target
resource "aws_efs_mount_target" "default_mount_target" {
  count           = length(var.public_subnets.subnets)
  subnet_id       = element(var.public_subnet_ids, count.index % 2)
  file_system_id  = aws_efs_file_system.default_file_system.id
  security_groups = [var.internal_sg_id]
}