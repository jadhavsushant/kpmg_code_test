# terraform block
terraform {
  required_version = ">= 0.13.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.86.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# provider block
provider "azurerm" {
  features {
  }
}
