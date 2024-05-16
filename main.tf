resource "azurerm_resource_group" "tf_rg_pratul" {
  name     = "tf_rg_pratul"
  location = "Central India"
}


resource "azurerm_storage_account" "tf_storage_pratul" {
  name                     = "tfstoragepratul"
  resource_group_name      = azurerm_resource_group.tf_rg_pratul.name
  location                 = azurerm_resource_group.tf_rg_pratul.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  depends_on               = [azurerm_resource_group.tf_rg_pratul]
}

resource "azurerm_storage_container" "tf_container" {
  name                  = "tfcontainer"
  storage_account_name  = azurerm_storage_account.tf_storage_pratul.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.tf_storage_pratul]
}