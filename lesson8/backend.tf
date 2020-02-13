terraform {
  backend "s3" {
    bucket = "yrzhang-s3-state"
    key    = "remote/dev.tfstate"
    region = "ap-east-1"
  }
}