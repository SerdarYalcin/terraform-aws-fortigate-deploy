terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

data "aws_vpc" "Office-USA" {
  filter {
    name   = "tag:Name"
    values = ["tag-value"]
  }
}


resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = data.aws_vpc.RS2-Office-USA.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "private subnet az1"
  }
}

resource "aws_subnet" "HA" {
  vpc_id            = data.aws_vpc.Office-USA.id
  cidr_block        = var.hacidr
  availability_zone = var.az1
  tags = {
    "Name" = "HA Subnet"
  }
}

resource "aws_subnet" "Management" {
  vpc_id            = data.aws_vpc.Office-USA.id
  cidr_block        = var.mgmtcidr
  availability_zone = var.az1
  tags = {
    "Name" = "Management Subnet"
  }
}
