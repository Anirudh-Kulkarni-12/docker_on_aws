variable "cidr_block" {}

variable "availability_zone" {
  type = list(string)
  default = [ "ap-sount-2a", "ap-sount-2b", "ap-south-2c"]
}