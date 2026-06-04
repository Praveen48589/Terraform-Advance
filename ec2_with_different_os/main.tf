resource "aws_key_pair" "key_pair" {
  key_name = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "default-vpc"
  }
}


resource "aws_instance" "ec2" {
  for_each = var.configuration
  ami = each.value.ami
  key_name = aws_key_pair.key_pair.key_name
  instance_type = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.sg[each.key].id]

  root_block_device {
    volume_size = each.value.root_block_device.volume_size
    volume_type = each.value.root_block_device.volume_type
  }

  tags = {
    Name = each.key
  }
  
}


resource "aws_security_group" "sg" {
  for_each = var.configuration

  name = "${each.key}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${each.key}-sg"
  }
}