resource "azurerm_cosmosdb_account" "cosmosdb" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  kind             = "MongoDB"
  offer_type       = "Standard"
  enable_free_tier = true
  public_network_access_enabled = false
  tags             = var.tags

  consistency_policy {
    consistency_level = "Eventual"
  }

  geo_location {
    failover_priority = 0
    location          = var.location
  }

  capabilities {
    name = "EnableMongo"
  }

  capabilities {
    name = "EnableAggregationPipeline"
  }
}