provider "azurerm" {
    # We recommend pinning to the specific version of the Azure Provider you're using
    # since new versions are released frequently
    version = "=2.20.0"
    features {}
}

# Resource Group
resource "azurerm_resource_group" "azurerg" {
  name     = var.resource_group_name
  location = var.location
}
# Storage Account
resource "azurerm_storage_account" "azurestor" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.azurerg.name
  location                 = azurerm_resource_group.azurerg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Development"
  }
}

# Information Output
output "resource-group-id" {
  value       = azurerm_resource_group.azurerg.id
  description = "Azure Resource Group Internal ID."
}



