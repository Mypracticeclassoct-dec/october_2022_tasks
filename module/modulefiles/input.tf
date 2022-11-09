resource "aws_vpc" "vpcmod" {
  cidr_block = var.cidr
  tags = {
    "Name" = "vpcmodule"
  }
}
resource "aws_subnet" "subnetmod" {
  vpc_id            = aws_vpc.vpcmod.id
  count             = length(var.subnet_cidr)
  cidr_block        = var.subnet_cidr[count.index]
  availability_zone = var.subnet_az[count.index]
  tags = {
    "Name" = var.subnet_nm[count.index]
  }
}
resource "aws_internet_gateway" "gwmod" {
  vpc_id = aws_vpc.vpcmod.id
  tags = {
    "Name" = "internetgwmodule"
  }
}
resource "aws_route_table" "s3routetb" {
  vpc_id = aws_vpc.vpcmod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwmod.id
  }
  tags = {
    "Name" = "routetable_s3"
  }
}
// route table association the subnet

resource "aws_route_table_association" "ass_subnet" {
  route_table_id = aws_route_table.s3routetb.id
  count          = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnetmod[count.index].id

}

// creating the security group

resource "aws_security_group" "s3secgp" {
  vpc_id      = aws_vpc.vpcmod.id
  description = "This is the security group for the vpc "
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is for ssh"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is for http"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is for https"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "To allow all"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
  tags = {
    "Name" = "security_s3"
  }
}
