// you can import exiting terraform on cloud in terraform states :: 


# import {
#   id = 
#   to = aws_instance.my_exiting_instance
# }

# resource "aws_instance" "my_exiting_instance" {
#     ami = ""   // put here you exiting instance ami
#     instance_type = ""  //instance type
#     key_name =   // key name

#     tags = {
#       Name = "Marco"
#     }
   
# }

# resource "aws_ec2_instance_state" "instance_state" {
#     instance_id = aws_instance.my_exiting_instance.id
#     state = "running"   // if exiting instance is stop
  
# }