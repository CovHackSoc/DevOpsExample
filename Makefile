.PHONY: terraform

.terraform:
	terraform init terraform

terraform: .terraform
	terraform apply -var-file ./terraform/config.tfvars terraform
