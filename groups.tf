resource "azuread_group" "iam_engineers" {
  display_name     = "IaC - IAM Engineers"
  security_enabled = true
  mail_enabled     = false
  members          = [azuread_user.lab_user_1.object_id]
}

resource "azuread_group" "helpdesk_staff" {
  display_name     = "IaC - Helpdesk Staff"
  security_enabled = true
  mail_enabled     = false
  members          = [azuread_user.lab_user_2.object_id]
}