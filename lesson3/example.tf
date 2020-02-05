provider "aws" {
  region     = var.region
}


#terraform apply \
#  -var 'region=us-east-2'


#terraform apply \
#  -var-file="secret.tfvars" \
#  -var-file="production.tfvars"


resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}


#terraform apply -var 'amis={ us-east-1 = "foo", us-west-2 = "bar" }'

output "ip" {
  value = aws_eip.ip.public_ip
}