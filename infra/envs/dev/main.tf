data "aws_availability_zones" "available" {}

resource "aws_vpc" "this" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name    = "${var.project}-vpc"
        Project = var.project
    }
}


resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.this.id
    cidr_block              = "10.0.1.0/24"
    aws_availability_zone   = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true

    tags = {
        Name    = "${var.project}-public-subnet"
        Project = var.project
    }
}


resource "aws_internet_getway" "this" {
    vpc_id = 
}
