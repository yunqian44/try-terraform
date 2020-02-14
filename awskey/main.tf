provider "aws" {
  region = "ap-east-1"
}

resource "aws_key_pair" "yang" {
  key_name   = "yang"
  public_key = file("~/.ssh/id_rsa.pub")
}