resource "aws_vpc" "main" {
  cidr_block                        = "172.31.0.0/16"

}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.50.0/24"
}

output "vpc_cidr_block" {
    value = "${aws_vpc.main.id}"
}