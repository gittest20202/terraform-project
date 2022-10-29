locals {
    port_in = [
       443,
       80,
       22
     ]
    port_out = [
       0
      ]
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = "${var.vpcid}"
  dynamic "ingress" {
       for_each = toset(local.port_in)
       content {
          description = "Traffic from Outside"
          from_port = ingress.value
          to_port   = ingress.value
          protocol  = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
         }
      }
  dynamic "egress" {
       for_each = toset(local.port_out)
       content {
          description = "Traffic to Outside"
          from_port = egress.value
          to_port = egress.value
          protocol = "-1"
          cidr_blocks = ["0.0.0.0/0"]
         }
      }
   tags = {
      Name = "ssh-allowed"
    }
}

