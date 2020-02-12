provider "aws" {
  profile = "default"
  region  = "ap-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-5ad2972b"
  instance_type = "t3.micro"

  tags = {
    name = "test"
  }
}