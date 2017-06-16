terraform {
	required_version = ">= 0.9.1"
	backend "s3" {
		bucket = "terraform-state-aet935"
		key = "terraform/terraform.tfstate"
		region = "us-east-1"
	}
}