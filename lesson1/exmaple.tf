provider "aws" {
  profile = "default"
  region  = "ap-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-db3d78aa"
  instance_type = "t3.micro"
}