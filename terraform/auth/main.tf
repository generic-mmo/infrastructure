resource "azuread_application" "application" {
  name = "build-server"

  app_role {
    allowed_member_types = ["User", "Application"]
    description          = "build-server"
    display_name         = "Contributor"
    value                = "Contributor"
  }
}

resource "azuread_service_principal" "principal" {
  application_id = azuread_application.application.application_id
}

resource "azuread_service_principal_password" "principal_password" {
  service_principal_id = azuread_service_principal.principal.id
  value                = random_password.principal_password.result
  end_date_relative    = "2400h"
  description          = "Principal secret"
}

resource "random_password" "principal_password" {
  length  = 32
  lower   = true
  upper   = true
  number  = true
  special = false
}

resource "local_file" "service_principal_secret" {
  filename          = "client_secret"
  sensitive_content = azuread_service_principal_password.principal_password.value
}

output "client_id" {
  value = azuread_service_principal.principal.id
}