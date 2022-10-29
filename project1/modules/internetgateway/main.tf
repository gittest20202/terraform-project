resource "aws_internet_gateway" "ingateway" {
   vpc_id = "${var.vpcid}"
   tags = {
      Name = "dev-ig"
    }
}
