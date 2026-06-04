output "public_ips" {
    value = {
        for name, instance in aws_instance.ec2 : name =>  instance.public_ip
    }
  
}