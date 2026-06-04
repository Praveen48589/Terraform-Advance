variable "my_dynamodb_table" {
    description = "dynamodb table name"
    type = string
    default = "my_dynamodb_table"  
  
}

variable "env" {
    description = "dev env"
    type = string
  
}

variable "table_count" {
    description = "Number of tables"
    type = string
  
}


