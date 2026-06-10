resource "azuread_application" "sample_app" {
  display_name = "IaC - Sample Web Application"

  sign_in_audience = "AzureADMyOrg"

  web {
    redirect_uris = ["https://localhost:5001/signin-oidc"]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "sample_app_sp" {
  client_id = azuread_application.sample_app.client_id
}