resource "azurerm_storage_account" "str" {
    name                        = var.strName
    resource_group_name         = var.rgName
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}