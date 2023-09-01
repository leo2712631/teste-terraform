terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

required_version = "~>1.2.0"
}

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_vpc" "exemplo" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "exemplo1" {
  vpc_id = aws_vpc.exemplo.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  
}

resource "aws_instance" "exemplo" {
    ami = "ami-0930cf22cf541fa4e"
    instance_type = "t2.micro"
    key_name = "meu-par-de-chaves"
    subnet_id = aws_subnet.exemplo1.id
}