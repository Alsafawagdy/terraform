###############VPC#################
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-vpc"
  }
}
################subnets############
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {
    Name = "terraform-public-subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "terraform-private-subnet"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet2_cidr
  tags = {
    "Name" = "terrform-private-subnet-2"
  }
}