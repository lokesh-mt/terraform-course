terraform {
	backend "s3" {
		bucket = "terraform-demo-aet935"
		key = "terraform/demo4"
		region = "us-east-1"
		lock = "false"
	}
}