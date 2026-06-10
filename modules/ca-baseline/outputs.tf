output "blocked_countries_location_id" {
  description = "ID of the high-risk countries named location"
  value       = azuread_named_location.blocked_countries.id
}

output "policy_ids" {
  description = "Map of policy names to their IDs"
  value = {
    block_legacy_auth         = azuread_conditional_access_policy.block_legacy_auth.id
    block_high_risk_countries = azuread_conditional_access_policy.block_high_risk_countries.id
  }
}