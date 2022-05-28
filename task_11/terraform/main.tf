# Implement Terraform locking
resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-state-lock-task-10-bucket"
}

resource "aws_dynamodb_table" "dynamodb_terraform_state_lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}