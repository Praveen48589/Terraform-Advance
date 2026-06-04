

# Create s3 bucket
resource "aws_s3_bucket" "my_bucket" {
    count = var.bucket_count
    bucket = "${var.env}-${var.bucket_name}-${count.index + 1}"
    tags = {
      Name = "${var.bucket_name}-${count.index + 1}"
    }

}