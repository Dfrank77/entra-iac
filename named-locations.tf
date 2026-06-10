resource "azuread_named_location" "trusted_us" {
  display_name = "IaC - Trusted US Locations"

  country {
    countries_and_regions = ["US"]
    include_unknown_countries_and_regions = false
  }
}

resource "azuread_named_location" "blocked_countries" {
  display_name = "IaC - High-Risk Countries"

  country {
    countries_and_regions = ["KP", "IR", "RU", "BY"]
    include_unknown_countries_and_regions = false
  }
}