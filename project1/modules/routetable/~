resource "aws_route_table" "route_table" {
   vpc_id = "${var.vpcid}"
   route {
       cidr_block = "0.0.0.0/0"
       gateway_id = "${var.ing}"
       }
   tags = {
      Name = "dev-pubintacc"
     }
}

resource "aws_route_table_association" "public-access" {
    subnet_id = "${var.pubsub}"
    route_table_id = "${aws_route_table.route_table.id}"
}
