terraform {
  backend "s3" {
    bucket = "yrzhang-s3-state"
    key    = "remote"
    region = "ap-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "yrzhang-s3-state"
    key    = "remote"
    region = "ap-east-1"
  }
}