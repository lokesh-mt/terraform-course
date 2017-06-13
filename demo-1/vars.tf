variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-20631a36" 
	us-west-2 = "ami-45224425"
	us-east-2 = "ami-a5b196c0"
  }
}
