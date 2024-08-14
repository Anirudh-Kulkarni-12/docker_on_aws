data "aws_ami" "amazon_instance" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "architecture"
      values = ["x86_64"]
    }
  
}



resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.amazon_instance.image_id
    instance_type = var.instance_type

    tags = {
      value = "Test-Instance"
    }
  
}