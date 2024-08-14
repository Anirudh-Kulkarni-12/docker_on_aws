resource "aws_subnet" "custom_public_subnet" {
  count = 3  
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = cidrsubnet(aws_vpc.custom_vpc.cidr_block, 8, count.index+1)
  map_public_ip_on_launch = true
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    value = "public-subnet${count.index}"
  }
}


/*
resource "aws_subnet" "custom_private_subnet" {
  count = 3  
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = cidrsubnet(aws_vpc.custom_vpc.cidr_block, 7, count.index+1)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    value = "private-subnet${count.index}"
  }
}

*/