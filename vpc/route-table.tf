resource "aws_route_table" "custom_public_route" {
    vpc_id = aws_vpc.custom_vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
    }

    tags = {
      value = "custom_public_route"
    }
}

resource "aws_route_table_association" "public_RT_association" {
    subnet_id = aws_subnet.custom_public_subnet[count.index].id
    route_table_id = aws_route_table.custom_public_route.id
    count = 3
}