resource "aws_vpc" "vpc" {
   cidr_block = "${var.cidr}"
   enable_dns_support = "${var.dnssupport}"
   enable_dns_hostnames = "${var.dnshostname}"
   instance_tenancy = "default"

   tags = {
      Name = "dev-vpc"
     }
}
