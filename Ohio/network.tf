data "aws_eip" "Nat-Gateway" {
  filter {
    name   = "tag:Name"
    values = ["Nat-Gateway"]
  }
}
//NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = data.aws_eip.Nat-Gateway.id
  subnet_id     = aws_subnet.privatesubnetaz1.id
  tags = {
    "Name" = "Nat-Gateway"
  }
}

// Route Table
resource "aws_route_table" "fgtvmprivatert" {
  depends_on = [aws_nat_gateway.nat]
  vpc_id     = data.aws_vpc.RS2-Office-USA.id

  tags = {
    Name = "Private"
  }
}

resource "aws_route" "internalroute" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = aws_route_table.fgtvmprivatert.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "public1associate" {
  subnet_id      = aws_subnet.HA.id
  route_table_id = "rtb-00fded80afa582ea5"
}

resource "aws_route_table_association" "public1associate2" {
  subnet_id      = aws_subnet.Management.id
  route_table_id = "rtb-00fded80afa582ea5"
}

resource "aws_route_table_association" "internalassociate" {
  subnet_id      = aws_subnet.privatesubnetaz1.id
  route_table_id = aws_route_table.fgtvmprivatert.id
}

resource "aws_eip" "FGTPublicIP" {
  depends_on        = [aws_instance.fgtvm]
  vpc               = true
  network_interface = aws_network_interface.eth0.id
}

// Security Group

resource "aws_security_group" "public_allow" {
  name        = "Public Allow"
  description = "Public Allow traffic"
  vpc_id      = data.aws_vpc.RS2-Office-USA.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Allow"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "Allow All"
  description = "Allow all traffic"
  vpc_id      = data.aws_vpc.RS2-Office-USA.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Allow"
  }
}
