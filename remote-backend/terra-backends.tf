resource "random_id" "rand-id" {
    byte_length = 8
  
}


# Create s3 bucket
resource "aws_s3_bucket" "backend-bucket" {
    bucket = "remote-backend-${lower(random_id.rand-id.hex)}"
}

# Create dyanmodb table

resource "aws_dynamodb_table" "remote-table" {
  name           = "remote-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "remote-table"
  }
}