variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable AMIS {
	type = "map"
	default = {
		us-east-1a = "ami-20631a36" 
		us-east-1b = "ami-20631a36"
		us-east-1c = "ami-20631a36"
	}
}

variable PUBLIC_CIDRS {
	type = "list"
	default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable PRIVATE_CIDRS {
	type = "list"
	default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}