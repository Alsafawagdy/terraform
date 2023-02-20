output "bastion_id" {
  value = aws_instance.bastion.id
}

output "application_id" {
  value = aws_instance.application.id
}
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "image_name" {
  value = data.aws_ami.ubuntu.name
}
