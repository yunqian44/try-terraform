provider "aws" {
  region = "ap-east-1"
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "vpc-instance"
  }
}

resource "aws_subnet" "default" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name = "subnet-instance"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "igw-instance"
  }
}

resource "aws_route" "default" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_security_group" "default" {
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami                         = "ami-5ad2972b"
  instance_type               = "t3.micro"
  key_name                    = "yang"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.default.id
  vpc_security_group_ids      = [aws_security_group.default.id]

  tags = {
    name = "ec2-webserver"
  }
}
