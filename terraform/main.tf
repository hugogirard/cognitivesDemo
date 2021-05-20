resource azurerm_resource_group "rg" {
    name        = var.rgName
    location    = var.location
}

module "storage" {
    source      = "./modules/storage"
    strName     = var.strName
    location    = var.location
    rgName      = azurerm_resource_group.rg.name
}