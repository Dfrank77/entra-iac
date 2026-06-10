terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50"
    }
  }
}

provider "azuread" {
  tenant_id = "e5e2596b-f25e-4c40-9504-d9a5aaef7304"
}