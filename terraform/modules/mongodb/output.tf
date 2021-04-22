output "id" {
  value = azurerm_cosmosdb_account.cosmosdb.id
}

output "connection_strings" {
  value     = azurerm_cosmosdb_account.cosmosdb.connection_strings
  sensitive = true
}
