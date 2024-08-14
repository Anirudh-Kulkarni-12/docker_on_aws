resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    value = "custom-igw"
  }
}

output "custom-igw" {
  value = aws_internet_gateway.custom_igw.id
}

