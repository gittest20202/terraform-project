terraform {
    required_providers {
       aws = {
          source = "hashicorp/aws"
          version = "4.37.0"
        }
     }
  }


provider "vault" {
   address = "http://vault.example.com:8200"
   token = "s.ACAY6Z4J7HESFhvbMDTTeEc4"
}

data "vault_aws_access_credentials" "aws_creds" {
   backend = "aws"
   role = "allaccess-role"
}
provider "aws" {
  region     = "us-east-1"
  access_key = "${data.vault_aws_access_credentials.aws_creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.aws_creds.secret_key}"
  # access_key = "AKIARWO2ZQUEFB2ZKG7J"
  #secret_key = "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"
}

module "vpc_module" {
  source = "./modules/vpc"
}
module "subnet_module" {
  source = "./modules/subnets"
  vpcid = "${module.vpc_module.vpc_id}"
}

module "ig_module" {
  source = "./modules/internetgateway"
  vpcid = "${module.vpc_module.vpc_id}"
}
module "rt_module" {
  source = "./modules/routetable"
  vpcid = "${module.vpc_module.vpc_id}"
  ing = "${module.ig_module.ig_id}"
  pubsub = "${module.subnet_module.pubsub_id}"
}
module "sec_module" {
  source = "./modules/securitygrp"
  vpcid = "${module.vpc_module.vpc_id}"
}
module "ec2_module" {
  source = "./modules/ec2"
  vpcid = "${module.vpc_module.vpc_id}"
  secid = "${module.sec_module.secid}"
  pubsub = "${module.subnet_module.pubsub_id}"
}
