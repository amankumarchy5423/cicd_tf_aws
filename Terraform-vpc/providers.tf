terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  # }
  #   backend "s3" {
  #   bucket   = "terraform-backend-faa8ca0bcf "
  #   key      = "terraform.tfstate"
  #   region   = "ap-south-1"
  }

}

provider "aws" {
  region = "ap-south-1"
}