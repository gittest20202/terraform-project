resource "aws_instance" "web1" {
   count = var.instance_count
   ami = "${var.AMI}"
   instance_type = "${var.instance_type}"
   subnet_id = "${var.pubsub}"
   vpc_security_group_ids = ["${var.secid}"]
   key_name = "aws_key"
   tags = {
      Name = "Terraform-${count.index + 1}"
      Batch = "5AM"
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
