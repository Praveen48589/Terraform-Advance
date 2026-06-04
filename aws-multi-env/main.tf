locals {
  env = {
    dev = {
      instance_count = 2
      table_count = 1
      bucket_count = 2

    }

    staging = {
      instance_count = 3
      table_count = 1
      bucket_count = 2
    }

    prod = {
      instance_count = 3
      table_count = 2
      bucket_count = 2
    }
  }

  current = lookup(local.env,terraform.workspace, local.env["dev"])
}

# module "ec2" {
#     source = "./modules/ec2"
#     env = terraform.workspace
#     instance_count = local.current.instance_count
   
# }

module "dynamodb" {
    source = "./modules/dynamodb"
    env = terraform.workspace
    table_count = local.current.table_count
    
}

module "s3" {
    source = "./modules/s3"
    env = terraform.workspace
    bucket_count = local.current.bucket_count
}