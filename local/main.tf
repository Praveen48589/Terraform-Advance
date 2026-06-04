terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
  }
}

# provider "aws" {
#   region = "ap-south-1"
# }


resource "local_file" "my_file" {
    filename = "demo.txt"
    content = "hello buddy!!"
    file_permission = "0664" // read-write , read-write, read 
  
}