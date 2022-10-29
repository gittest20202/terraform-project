resource "aws_subnet" "public_subnet" {
  vpc_id = "${var.vpcid}"
  map_public_ip_on_launch = "true"
  cidr_block = "${var.publicsub}"
  
  tags = {
     Name = "dev-public-subnet"
  }
}

resource "aws_subnet" "privet_subnet" {
  vpc_id = "${var.vpcid}"
  cidr_block = "${var.privatesub}"
  
  tags = {
     Name = "dev-private-subnet"
  }
}
