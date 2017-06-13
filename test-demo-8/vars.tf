variable "region" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable AMIS {
	type = "map"
	default = {
		us-east-1 = "ami-20631a36" 
		us-west-2 = "ami-45224425" 
	}
}

variable PUBLIC_CIDRS {
	type = "list"
	default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable PRIVATE_CIDRS {
	type = "list"
	default = ["10.0.3.0/24", "10.0.4.0/24"]
}