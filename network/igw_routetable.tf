###############IGW#################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "terraform-IGW"
  }
}
#############Tables################
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.terraform_vpc.id
}
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.terraform_vpc.id
}
#############Routes################
resource "aws_route" "public-R" {
  route_table_id         = aws_route_table.public_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
# resource "aws_route" "private-R" {
#     route_table_id              = aws_route_table.private_RT.id
#     destination_cidr_block = "0.0.0.0/0"
#     gateway_id = nat
# }
#############Assosiation################
resource "aws_route_table_association" "public_RTA" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_RT.id
}
resource "aws_route_table_association" "private_RTA" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_RT.id
}
resource "aws_route_table_association" "private_RTA2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_RT.id
}
                