variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "service_accounts_keys" {
  description = "Flag to create service account keys"
  type        = bool
  default     = false
}
variable "secret_id" {
  description = "The secret ID for Secret Manager"
  type        = string
}
variable "account_id" {
  default = ""
}
variable "private_key_type" {
  description = "The output format of the private key"
  type        = string
  default     = "TYPE_GOOGLE_CREDENTIALS_FILE"
}
variable "roles" {
  description = "A map of roles to bind to the service account"
  type        = map(string)
  default     = {}
}