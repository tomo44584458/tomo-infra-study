# tfstateを置くS3バケット
resource "aws_s3_bucket" "tfstate" {
  bucket = "${var.project}-tfstate-${var.account_id}"

  tags = {
    Name    = "${var.project}-tfstate"
    Project = var.project
  }
}

# 事故防止：パブリックアクセスは全部ブロック
resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 暗号化（SSE-S3）
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# バージョニング（壊しても戻せる保険）
resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

# stateロック用 DynamoDB
resource "aws_dynamodb_table" "tflock" {
  name         = "${var.project}-tflock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name    = "${var.project}-tflock"
    Project = var.project
  }
}
