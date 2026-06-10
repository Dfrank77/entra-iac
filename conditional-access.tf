module "ca_baseline" {
  source = "./modules/ca-baseline"

  policy_prefix         = "IaC"
  policy_state          = "disabled"
  blocked_country_codes = ["KP", "IR", "RU", "BY", "CN"]
  breakglass_object_ids = var.breakglass_object_ids
}

resource "azuread_conditional_access_policy" "require_mfa_admins" {
  display_name = "IaC - Require MFA for Admin Roles"
  state        = "disabled"

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_roles = [
        "62e90394-69f5-4237-9190-012177145e10",
        "194ae4cb-b126-40b2-bd5b-6091b380977d",
        "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3",
      ]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}
