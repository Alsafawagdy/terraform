data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "bastion" {
  instance_type               = "t2.micro" # free instance
  ami                         = data.aws_ami.ubuntu.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg1.id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  tags = {
    "Name" : "bastion"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.bastion.public_ip}"
  }
}
resource "aws_instance" "application" {
  instance_type          = "t2.micro" # free instance
  ami                    = data.aws_ami.ubuntu.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg2.id]
  subnet_id              = var.private_subnet_id
  tags = {
    "Name" : "application"
  }
}


