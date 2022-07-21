provider "azurerm" {
  subscription_id = var.subscription_id
  #version = ">= 2.0.0"
  features {}
}

data "azurerm_client_config" "current" {}

terraform {
  required_providers {
     azurerm = {
     source  = "hashicorp/azurerm"
     version = "=2.27.0"
    }
  }
  required_version = ">=0.12.0"
  backend "azurerm" {
  }
}
