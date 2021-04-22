locals {
  common_tags = {
    project     = var.project
    environment = var.environment
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.project}-${var.environment}"
  location = var.location
  tags     = local.common_tags
}

module "mongodb" {
  source = "../../modules/mongodb"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = "map-repository"
  tags                = local.common_tags
}

module "app-plan" {
  source = "../../modules/app-plan"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = "app-service-plan"
  tags                = local.common_tags
}

module "cartographer" {
  source = "../../modules/app"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = "cartographer-generic-mmo"
  tags                = local.common_tags

  app_service_plan_id = module.app-plan.id

  docker_image = "genericmmo/mmo-api:0.0.1"
  env_variables = {
    MONGO_CONNECTION_STRING = module.mongodb.connection_strings[0]
  }
}
