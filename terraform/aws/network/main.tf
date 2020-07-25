resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "dev_vpc"
    Env  = "dev"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "dev_gw"
    Env  = "dev"
  }
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "default route table"
    env  = "dev"
  }
}

resource "aws_subnet" "public" {
  vpc_id                    = aws_vpc.vpc.id
  cidr_block                = "10.0.1.0/24"
  map_public_ip_on_launch   = "true"
  tags = {
    Name                    = "public_subnet"
    Env                     = "dev"
  }
}

resource "aws_security_group" "public_security_group" {
  vpc_id       = aws_vpc.vpc.id
  name         = "Public VPC Security Group"
  description  = "Public VPC Security Group"
  
  # allow ingress of port 22
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  } 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Public VPC Security Group"
    Description = "Public VPC Security Group"
  }
}

output "vpc_cidr_block" {
    value = "${aws_vpc.vpc.id}"
}