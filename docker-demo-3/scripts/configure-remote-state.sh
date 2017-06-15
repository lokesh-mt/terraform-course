#!/bin/bash
terraform init -backend-config="terraform-state-aet935" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=us-east-1"