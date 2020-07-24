resource "aws_instance" "k8cluster-linux" {
  ami = "ami-13b8337c"
  instance_type = "t2.micro"
}