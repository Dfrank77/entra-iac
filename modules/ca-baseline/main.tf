resource "azuread_named_location" "blocked_countries" {
  display_name = "${var.policy_prefix} - High-Risk Countries"

  country {
    countries_and_regions                 = var.blocked_country_codes
    include_unknown_countries_and_regions = false
  }
}

resource "azuread_conditional_access_policy" "block_legacy_auth" {
  display_name = "${var.policy_prefix} - Block Legacy Authentication"
  state        = var.policy_state

  conditions {
    client_app_types = ["exchangeActiveSync", "other"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
}

resource "azuread_conditional_access_policy" "block_high_risk_countries" {
  display_name = "${var.policy_prefix} - Block Sign-Ins from High-Risk Countries"
  state        = var.policy_state

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
    }

    locations {
      included_locations = [azuread_named_location.blocked_countries.id]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
}