provider "aws" {
  profile = "default"
  region  = "ap-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-5ad2972b"
  instance_type = "t3.micro"
  depends_on = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "yrzhang-lesson2-s3"
  acl    = "private"
}