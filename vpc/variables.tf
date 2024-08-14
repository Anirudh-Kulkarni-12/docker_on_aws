variable "cidr_block" {}

variable "availability_zone" {
  type = list(string)
  default = [ "ap-south-2a", "ap-south-2b", "ap-south-2c"]
}