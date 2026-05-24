terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAUWAXEHTEIMYTJWTS"
  secret_key = "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"
}
