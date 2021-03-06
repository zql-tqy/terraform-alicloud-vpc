variable "region" {
  default = "cn-hangzhou"
}
provider "alicloud" {
  region = var.region
}


module "vpc" {
  source = "../../"
  region = var.region

  vpc_name = "complete-example"

  vpc_cidr = "10.10.0.0/16"

  availability_zones = ["cn-hangzhou-e", "cn-hangzhou-f", "cn-hangzhou-g"]
  vswitch_cidrs      = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]

  vpc_tags = {
    Owner       = "user"
    Environment = "staging"
    Name        = "complete"
  }

  vswitch_tags = {
    Project  = "Secret"
    Endpoint = "true"
  }
}

# This vpc and other resources won't be created
module "vpc_zero" {
  source = "../.."
  region = var.region

  create   = false
  vpc_name = "complete-example"

  vpc_cidr = "10.10.0.0/16"

  availability_zones = ["cn-hangzhou-e", "cn-hangzhou-f", "cn-hangzhou-g"]
  vswitch_cidrs      = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}