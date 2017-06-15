resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-aet935"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
