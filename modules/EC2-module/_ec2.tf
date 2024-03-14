resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count         = 1

  key_name = aws_key_pair.example_key.key_name
  security_groups = [aws_security_group.example.name]

  tags = {
    Name        = "example-instance-${count.index + 1}"
    Environment = "development"
  }
}