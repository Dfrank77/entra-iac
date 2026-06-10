variable "lab_users" {
  description = "Map of lab users to create"
  type = map(object({
    display_name = string
    job_title    = string
    department   = string
  }))
  default = {
    "iac.user1" = {
      display_name = "IaC Lab User 1"
      job_title    = "IAM Engineer"
      department   = "Information Security"
    }
    "iac.user2" = {
      display_name = "IaC Lab User 2"
      job_title    = "Helpdesk Analyst"
      department   = "IT Operations"
    }
    "iac.user3" = {
      display_name = "IaC Lab User 3"
      job_title    = "Security Analyst"
      department   = "Information Security"
    }
  }
}

resource "azuread_user" "lab_users" {
  for_each = var.lab_users

  user_principal_name = "${each.key}@${var.domain_name}"
  display_name        = each.value.display_name
  mail_nickname       = each.key
  password            = var.user_password
  job_title           = each.value.job_title
  department          = each.value.department
}

