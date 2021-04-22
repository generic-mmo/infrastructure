resource "azurerm_app_service_plan" "app_plan" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  kind     = "Linux"
  reserved = true

  sku {
    size = "F1"
    tier = "Free"
  }
}