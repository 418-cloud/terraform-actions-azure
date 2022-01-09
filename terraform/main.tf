terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-gh-actions-storage"
    storage_account_name = "tfghdemostorage"
    container_name       = "infrastate"
    key                  = "demo.tfstate"
  }
}

provider "azurerm" {
}