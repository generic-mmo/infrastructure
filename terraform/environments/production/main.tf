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

module "app" {
  source = "../../modules/app"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = "generic-mmo"
  tags                = local.common_tags

  docker_image = "nginxdemos/hello:latest"
}
