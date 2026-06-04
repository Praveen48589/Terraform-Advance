variable "region" {
    description = "AWS region"
    type = string
    default = "ap-south-1"
  
}

variable "ami" {
    description = "Instance ami ID"
    type = string
    default = "ami-07a00cf47dbbc844c"  # for ubuntu server
  
}

variable "instance_type" {
    description = "Instance Type"
    type = string
    default = "t2.micro" 

  
}

variable "volume_size" {
    description = "Volume Size"
    type = string
    default = 20  
  
}

variable "volume_type" {
    description = "Volume Type"
    type = string
    default = "gp3"
  
}

variable "env" {
    description = "dev env"
    type = string
  
}

variable "instance_name" {
    description = "Instance Name"
    type = string
    default = "Actions"
  
}

variable "instance_count" {
    description = "Number of instances"
    type = string
  
}


