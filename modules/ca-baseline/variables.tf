variable "policy_prefix" {
  description = "Prefix for all CA policy display names"
  type        = string
  default     = "Baseline"
}

variable "policy_state" {
  description = "State for all policies (enabled, disabled, enabledForReportingButNotEnforced)"
  type        = string
  default     = "disabled"
}

variable "blocked_country_codes" {
  description = "ISO country codes to block sign-ins from"
  type        = list(string)
  default     = ["KP", "IR", "RU", "BY"]
}

variable "breakglass_object_ids" {
  description = "Object IDs of tenant break-glass accounts to exclude from block policies"
  type        = list(string)
  sensitive   = true
}