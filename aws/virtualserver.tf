variable "instance_size" {
  default = "t2.nano"
}

provider "aws" {
  profile = "default"
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-01720b5f421cf0179"
  instance_type = "${var.instance_size}"
}
