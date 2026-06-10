output "lab_user_object_ids" {
  description = "Object IDs of all lab users created by Terraform"
  value       = { for k, v in azuread_user.lab_users : k => v.object_id }
}

output "iam_engineers_group_id" {
  description = "Object ID of the IAM Engineers security group"
  value       = azuread_group.iam_engineers.object_id
}

output "sample_app_client_id" {
  description = "Client ID of the sample web application"
  value       = azuread_application.sample_app.client_id
}

output "blocked_countries_location_id" {
  description = "ID of the high-risk countries named location"
  value       = azuread_named_location.blocked_countries.id
}