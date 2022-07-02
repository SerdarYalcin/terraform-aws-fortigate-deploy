// AWS VPC 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "> 3.74.0"
    }
  }
}


resource "aws_subnet" "hasyncsubnet" {
  vpc_id            = data.aws_vpc.main.id
  cidr_block        = var.hasynccidr
  availability_zone = var.az
  tags = {
    Name = "hasync subnet"
  }
}

resource "aws_subnet" "hamgmtsubnet" {
  vpc_id            = data.aws_vpc.main.id
  cidr_block        = var.hamgmtcidr
  availability_zone = var.az
  tags = {
    Name = "hamgmt subnet"
  }
}

data "aws_vpc" "main" {
  filter {
    name = "tag:Name"
    values = ["tag-name"]
  }
}
