
##calling the AWS Providder as documented here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs 

provider "aws" {
  region  = "us-east-1"
  #statically typed credentials, gather ad-hoc from Okta login at time of use (auto-rotated)
  access_key = "ASIATXWVNGTZU4AFKXUU"
  secret_key = "0gkwnGoRvpr8xwZ3D684aqiiJmxkaXhl4cSXPaF3"
  skip_credentials_validation = true
  skip_requesting_account_id = true
}

###defining an EC2 instance to deploy as per the AWS Provider documentation
resource "aws_instance" "Ubuntu_Web_Server" {
    #ami image ID pulled from AWS Marketplace for US-East-1 on Sept 11 2020
    ami = "ami-06b263d6ceff0b3dd"
    instance_type = "t2.micro"
    
}

#defining an AWS VPC and subnets
resource "aws_vpc" "example-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Example-VPC"
  }
}

#defining subnet in the example-vpc
resource "aws_subnet" "example-subnet"{
  vpc_id = "${aws_vpc.example-vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}