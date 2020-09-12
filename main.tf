
##calling the AWS Providder as documented here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs 

provider "aws" {
  region  = "us-east-1"
  #statically defined credentials from pan-lab okta login to SSO Reserved user on Sept 11 2020
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