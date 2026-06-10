resource "azuread_user" "lab_user_1" {
  user_principal_name = "iac.user1@dfrank-iam.com"
  display_name        = "IaC Lab User 1"
  mail_nickname       = "iac-user1"
  password            = "TempPass!Lab-2026-01"
  job_title           = "IAM Engineer"
  department          = "Information Security"
}

resource "azuread_user" "lab_user_2" {
  user_principal_name = "iac.user2@dfrank-iam.com"
  display_name        = "IaC Lab User 2"
  mail_nickname       = "iac-user2"
  password            = "TempPass!Lab-2026-02"
  job_title           = "Helpdesk Analyst"
  department          = "IT Operations"
}