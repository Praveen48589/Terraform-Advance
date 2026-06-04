locals {
  ec2_key_name = var.env == "dev" ? terra-key : "terra-key-prod" // only file scoped
}




resource "aws_key_pair" "terra-key" {
  key_name   = local.ec2_key_name
  public_key = file("terra-key.pub")


}

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security group for ec2 instance"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTP Allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { // egress outgoing traffic :: 
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "Actions-sg"
  }


}

resource "aws_instance" "Actions" {
  count                       = 3
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.terra-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "Actions"
  }


}

resource "aws_ec2_instance_state" "test" {
  for_each = {
    for idx, instance in aws_instance.Actions :
    idx => instance.id
  }

  instance_id = each.value
  state       = "running"    # for run >> running , for stop >> stopped
}


