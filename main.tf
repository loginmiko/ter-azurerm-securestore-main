terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg"
  location = "East US"
}

module "securestore" {
  source  = "app.terraform.io/myInc/securestore/azurerm"
  version = "1.0.0"
  # insert required variables here
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  environment          = "Development"
  storage_account_name = "stgacc10050"
}