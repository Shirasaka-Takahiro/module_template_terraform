##Web Instance
resource "aws_instance" "web" {
  ami       = var.ami
  count     = length(var.public_subnets.subnets)
  subnet_id = element(var.public_subnet_ids, count.index % 2)
  vpc_security_group_ids = [
    var.internal_sg_id,
    var.operation_sg_1_id,
    var.operation_sg_2_id,
    var.operation_sg_3_id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${format("web%02d", count.index + 1)}"
  }
}

##Elastic IP
resource "aws_eip" "eip_ec2" {
  vpc      = true
  count    = length(aws_instance.web)
  instance = element(aws_instance.web.*.id, count.index % 2)

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${format("eip%02d", count.index + 1)}"
  }
}

##Key Pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}