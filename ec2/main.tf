data "aws_ami" "amazon_instance" {
    most_recent = true
    owners = ["amazon"]

     filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Filter for Amazon Linux 2 AMIs
  }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }
  
}

resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.amazon_instance.image_id
    instance_type = var.instance_type
    key_name =  "Terraformkey"
    vpc_security_group_ids = ["sg-0fb8ce257ceb10eec"]

    tags = {
      value = "Test-Instance"
    }

   connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./Terraformkey.pem")  # Ensure this file is available in your working directory
    host        = self.public_ip
  }

    provisioner "remote-exec" {
        inline = [ 
            "sudo yum update -y",
            "sudo yum install docker -y"
         ]
      
    }
  
}