output "service_account_email" {
  description = "The email of the service account"
  value       = module.iam.service_account_email
}

output "secret_id" {
  description = "The ID of the secret in Secret Manager"
  value       = module.iam.secret_id
}