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

resource "azurerm_app_service" "app" {
  app_service_plan_id = azurerm_app_service_plan.app_plan.id
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  app_settings = var.env_variables
  site_config {
    linux_fx_version          = "DOCKER|${var.docker_image}"
    always_on                 = false
    use_32_bit_worker_process = true
  }
}
