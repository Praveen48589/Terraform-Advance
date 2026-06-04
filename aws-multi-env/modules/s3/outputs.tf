output "bucket_name" {
    value = {
        for idx , bucket in aws_s3_bucket.my_bucket : idx => bucket.id
    }
  
}