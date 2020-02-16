provider "aws" {
  region = "ap-east-1" 
}

module "ecr" {
  source    = "./modules/ecr"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}