resource "aws_vpc" "vnet_tf" {
    count = length(var.cidr)
    cidr_block = var.cidr
    tags = {
      "Name" = "var.vpc_nm[count.index]"
    }
    }
resource "aws_subnet" "subnets" {
    count = length(var.subnet_nm)
    cidr_block = cidrsubnet(var.cidr[0],8,count.index)
    vpc_id = aws_vpc.vnet_tf[0].id
    availability_zone = var.subnet_az[count.index]
    tags = {
      "Name" = "var.subnet_nm[count.index]"
    }
}
resource "aws_subnet" "subnet2" {
    count = length(var.subnet_nm)
    cidr_block = cidrsubnet(var.cidr[1],8,count.index)
    vpc_id = aws_vpc.vnet_tf[1].id
    availability_zone = var.subnet_az[count.index]
    tags = {
      "Name" = "var.subnet_nm[count.index]"
    }
}