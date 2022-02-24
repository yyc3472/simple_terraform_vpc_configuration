# Provider
provider "aws" {
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = ">=4.2.0 "
  }
}
