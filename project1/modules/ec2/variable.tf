variable "AMI" {
    type = string
    default = "ami-09d3b3274b6c5d4aa"
}
variable "secid" {
    type = string
}

variable "pubsub" {
   type = string
}

variable "vpcid" {
   type = string
}
variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.nano"
}
