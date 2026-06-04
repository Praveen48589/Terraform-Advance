variable "region" {
  description = "AWS region"
  type = string
  default = "ap-south-1"
  
}




variable "configuration" {  
  type = map(object({
    ami             = string
    instance_type   = string

    root_block_device = object({
      volume_size = number
      volume_type = string
    })

    os_family = list(string)
  }))

  default = {
    ubuntu = {
      ami           = "ami-07a00cf47dbbc844c"
      instance_type = "t2.micro"

      root_block_device = {
        volume_size = 10
        volume_type = "gp3"
      }

      os_family = ["debian"]
    }

    Amazon_linux = {
      ami           = "ami-0685bcc683dadb6b9"
      instance_type = "t2.micro"

      root_block_device = {
        volume_size = 10
        volume_type = "gp3"
      }

      os_family = ["amazon"]
    }

    Redhat = {
      ami           = "ami-00a3ff43223e36738"
      instance_type = "t2.micro"

      root_block_device = {
        volume_size = 10
        volume_type = "gp3"
      }

      os_family = ["redhat"]
    }
  }
}