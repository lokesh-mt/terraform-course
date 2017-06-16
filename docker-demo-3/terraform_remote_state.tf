data "terraform_remote_state" "network" {
	backend = "s3"
	config {
		bucket = "terraform-state-aet935"
		key = "terraform/terraform.tfstate"
		region = "us-east-1"
	}
}