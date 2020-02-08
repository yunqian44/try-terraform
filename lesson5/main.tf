provider "aws" {
  region = "ap-east-1" 
}


module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "yrzhang-lesson5-s3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}