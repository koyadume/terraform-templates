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

resource "aws_subnet" "test-subnet" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "10.10.1.0/24"
}

resource "aws_instance" "test-vm" {
  ami = "ami-0d5075a2643fdf738"
  instance_type = "var.instance_size"
  subnet_id = aws_subnet.test-subnet.id
}
