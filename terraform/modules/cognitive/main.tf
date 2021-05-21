resource "azurerm_search_service" "search" {
    name                    = var.searchName
    resource_group_name     = var.rgName
    location                = var.location
    sku                     = "standard"
}