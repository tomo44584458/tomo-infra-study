terraform {
  backend "s3" {
    bucket         = "tomo-infra-study-tfstate-245760921698"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "tomo-infra-study-tflock"
    encrypt        = true
  }
}
