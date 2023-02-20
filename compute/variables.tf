variable "vpc_id" {
  type = string
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet_id" {
  type = string
}
variable "private_subnet_id" {
  type = string
}
variable "private_subnet2_id" {
  type = string
}
variable "key_name" {
  type = string
}