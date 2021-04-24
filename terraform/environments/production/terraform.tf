terraform {
  required_version = "0.15.0"

  backend "azurerm" {
    resource_group_name  = "infrastructure"
    storage_account_name = "genericmmo"
    container_name       = "terraform-state"
    key                  = "production.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.55.0"
    }
  }
}

provider "azurerm" {
  features {}
}