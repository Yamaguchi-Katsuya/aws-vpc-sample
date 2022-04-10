resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.system}-${var.env}-vpc"
  }
}
