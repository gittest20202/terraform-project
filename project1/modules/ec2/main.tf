resource "aws_instance" "web1" {
   ami = "${var.AMI}"
   instance_type = "t2.micro"
   subnet_id = "${var.pubsub}"
   vpc_security_group_ids = ["${var.secid}"]
   key_name = "aws_key"
   provisioner "remote-exec" {
      inline = [
          "touch hello.txt",
          "echo helloworld remote provisioner >> hello.txt"
       ]
    }
   connection {
         type = "ssh"
         host = self.public_ip
         user = "ec2-user"
         private_key = file("/opt/aws_key")
         timeout = "4m"
     }
}

resource "aws_key_pair" "aws_key" {
    key_name = "aws_key"
    public_key = file("/opt/aws_key.pub")
}
