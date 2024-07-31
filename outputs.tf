output "service_account_email" {
  description = "The email of the service account"
  value       = google_service_account.service-account.email
}

output "secret_id" {
  description = "The ID of the secret in Secret Manager"
  value       = google_secret_manager_secret.secret[0].id
}
