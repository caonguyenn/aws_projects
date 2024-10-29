terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]
}