resource "aws_vpc" "aman-vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags ={
    Name = "aman-vpc"
  }
}


# resource "aws_subnet" "public_subnet" {
#   cidr_block = "0.0.1.0/24"
#   vpc_id     = aws_vpc.aman-vpc.id

#   tags = {
#     Name= "public-subnet"
#   }
# }
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.aman-vpc.id
  count = length(var.subnet_cidr)
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name= var.subnet_name[count.index]
  }
}

resource "aws_internet_gateway" "aman-ig" {
  vpc_id     = aws_vpc.aman-vpc.id

  tags = {
    Name = "aman-ig"
  }
}

resource "aws_route_table" "aman-rt" {
  vpc_id     = aws_vpc.aman-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aman-ig.id
  }
}

resource "aws_route_table_association" "name" {
  count = length(var.subnet_cidr)
  subnet_id = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.aman-rt.id
}