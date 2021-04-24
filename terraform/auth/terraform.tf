terraform {
  required_version = "0.15.0"

  backend "azurerm" {
    resource_group_name  = "infrastructure"
    storage_account_name = "genericmmo"
    container_name       = "terraform-state"
    key                  = "service-principal.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azuread"
      version = "=1.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "azuread" {}

provider "random" {}

provider "local" {}
