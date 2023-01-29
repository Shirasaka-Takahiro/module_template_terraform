##Security Group
resource "aws_security_group" "default" {
  name = var.sg_name
  vpc_id = var.vpc_id
 
  #Ingrerss
  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  #Egress
  engress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg"
  }

}