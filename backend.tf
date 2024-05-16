terraform {
  backend "azurerm" {
    resource_group_name  = "pratul-learn-rg"
    storage_account_name = "pratulstorage"
    container_name       = "source"
    key                  = "prod.terraform.tfstate"
  }
}
