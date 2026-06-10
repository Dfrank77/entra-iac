variable "tenant_id" {
  description = "Entra ID tenant ID"
  type        = string
}

variable "user_password" {
  description = "Default password for lab users"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Verified domain for user UPNs"
  type        = string
  default     = "dfrank-iam.com"
}

variable "breakglass_object_ids" {
  description = "Object IDs of tenant break-glass accounts to exclude from block policies"
  type        = list(string)
  sensitive   = true
}