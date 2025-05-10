terraform {
  backend "azurerm" {
    resource_group_name  = "dominik06"
    storage_account_name = "dominik06storage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "382b6330-6cf0-4e15-b202-543c02240501"
  features {}
}

resource "azurerm_resource_group" "this" {
    name     = "rg-dominik06"
    location = "Poland Central"
}
