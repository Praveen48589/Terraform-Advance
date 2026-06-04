resource "aws_dynamodb_table" "my_dynamodb_table" {
  count = var.table_count
  name           = "${var.env}-table-${count.index + 1}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.env}-table-${count.index + 1}"
  }
}