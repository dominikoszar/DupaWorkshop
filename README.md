# Global Azure Poland 2025 - Warszawa - Warsztat GH + TF
We set up Azure infrastructure using Terraform with best practices, then create a GitHub Actions workflow to automate the deployment process. Instructor: Piotr Krukowski.

## Prerequisites
1. Install Terraform
2. Install Azure CLI
3. Install git

## Teorethical part about Terraform
- Infrastructure as Code (IaC)
- Terraform basics
- Terraform providers
- Terraform modules
- Terraform state
- Terraform backend
- Terraform variables
- Terraform outputs

## Practical part

1. Log in to Azure
2. Create a new resource group
3. Create a new storage account
4. Create a new container in the storage account
5. Create a new blob in the container

6. Create main.tf file
7. Write Terraform code to create a new resource group
8. Write Terraform code to create a new storage account

9. log into Azure with CLI
10. Terraform init
11. Terraform plan
12. Terraform apply (and see our locak tfstate file)
13. Terraform destroy

14. Assign role "Storage Blob Data Contributor" to the our user
15. Create tfstate blob in our storage account
16. Configure backend in main.tf