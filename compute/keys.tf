resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
  provisioner "local-exec" { # Create a "sprints_key" to your computer!!
    command = "echo '${tls_private_key.rsa.private_key_pem}' > ./${var.key_name}.pem"
  }
}

