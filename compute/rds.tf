# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
# #   apply_immediately = true
# #   db_subnet_group_name = aws_db_subnet_group.default.id
# #   vpc_security_group_ids = [ aws_security_group.db_sg.id ]
# }

# compute:
    # subnet_group.tf
        # resource "aws_db_subnet_group" "default" {
        #   name       = "main"
        #   subnet_ids = [var.private_subnet_id, var.private_subnet2_id]
        #   tags = {
        #     Name = "My DB subnet group"
        #   }
        # }
    #LOOK also  @ output.tf
        # output "database_endpoint" {
        # value = aws_db_instance.default.address
        # }
# output.tf 
# main
    # data "aws_availability_zones" "available" {
    # state = "available"
    # }