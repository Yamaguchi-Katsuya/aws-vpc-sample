provider "aws" {
  region = "ap-northeast-1"
  version = "~> 4.9"
}

module "network" {
  source = "../../module/vpc"
  system = "sample"
  env = "dev"
  cidr_vpc = "10.0.0.0/16"
  cidr_public = [
    "10.0.11.0/24",
    "10.0.12.0/24",
  ]
  cidr_private = [
    "10.0.110.0/24",
    "10.0.120.0/24",
  ]
}
