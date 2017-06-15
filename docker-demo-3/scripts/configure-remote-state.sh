#!/bin/bash
terraform init -backend=s3 -backend-config="bucket=terraform-state-aet935" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=us-east-1"
