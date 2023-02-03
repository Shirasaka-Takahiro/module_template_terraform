##Security Group Internal
resource "aws_security_group" "internal" {
  name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg"
  }

}

##Security Group Rule internal Ingress
resource "aws_security_group_rule" "internal_ingress" {
  type = "ingress"
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  cidr_blocks = [var.cidr_blocks]
  security_group_id = aws_security_group.internal.id
}

##Security Group Rule internal Egress
resource "aws_security_group_rule" "internal_egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.internal.id
}

##Security Group Operation
resource "aws_security_group" "operation" {
  name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg"
  }

}

##Security Group Rule Operation Ingress
resource "aws_security_group_rule" "operation_ingress" {
  type = "ingress"
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  cidr_blocks = var.operation_sg_source_ip_1
  security_group_id = aws_security_group.operation.id
}

##Security Group Rule Operation Egress
resource "aws_security_group_rule" "operation_egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.operation.id
}


