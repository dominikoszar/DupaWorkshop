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

resource "azurerm_container_app_environment" "this" {
  name                       = "dominik-cae"
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
}

variable "applications" {
  description = "list of conatiner apps"
  type = map(
    object({
      image  = string
      cpu    = number
      memory = string
    })
  )
  default = {}
} 

resource "azurerm_container_app" "this" {
  for_each = var.applications
  name                         = "dominik-app-${each.key}"
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = azurerm_resource_group.this.name
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 80
    transport        = "auto"
    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "${each.key}-container"
      image  = each.value.image
      cpu    = each.value.cpu
      memory = each.value.memory
    }
  }
}
