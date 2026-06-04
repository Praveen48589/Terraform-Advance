output "ec2_public_ip" {
    value = {
        for idx, instance in aws_instance.Actions : idx => instance.public_ip
    }
}


output "ec2_public-dns" {
    value = {
        for idx , instance in aws_instance.Actions : idx => instance.public_dns
    }
  
}

# output "exiting_instance-ip" {
#     value = aws_instance.my_exiting_instance.public_ip
  
# }