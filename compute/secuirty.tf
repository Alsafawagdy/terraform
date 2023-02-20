resource "aws_security_group" "sg1" {
  name   = "allow_ssh"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
}

resource "aws_security_group" "sg2" {
  name   = "allow_ssh_and_3000"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [var.vpc_cidr]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = [var.vpc_cidr]
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
  }
}

