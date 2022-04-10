provider "aws" {
  region = "ap-northeast-1"
  version = "~> 4.9"
}

module "network" {
  source = "../../module/vpc"
  system = "sample"
  env = "prd"
  cidr_vpc = "10.0.0.0/16"
  cidr_public = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  cidr_private = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
}
