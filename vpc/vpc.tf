resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block

  tags = {
    value = "custom_vpc"
  }
}