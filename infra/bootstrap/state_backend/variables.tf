variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "project" {
  type    = string
  default = "tomo-infra-study"
}

# さっきの aws sts get-caller-identity で取った数字を入れる
variable "account_id" {
  type = string
  default = "245760921698"

}
