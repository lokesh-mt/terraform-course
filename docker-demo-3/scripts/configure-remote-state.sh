#!/bin/bash
terraform init \
-backend=true  \
-force-copy \
-get=true \
-lock=true \
-backend-config="bucket=terraform-state-aet935" \
-backend-config="key=terraform/terraform.tfstate" \
-backend-config="region=us-east-1"