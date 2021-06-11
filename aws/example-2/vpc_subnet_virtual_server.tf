variable "instance_size" {
  default = "t2.nano"
}

provider "aws" {
  profile = "default"
  region = "eu-west-1"
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.1.0/24"
}

resource "aws_instance" "example" {
  ami = "ami-invalid"
  instance_type = "${var.instance_size}"
}
