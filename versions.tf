# Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = ">=4.2.0 "
  }
}
