data "google_project" "project" {
  project_id = var.project_id
}

resource "google_service_account" "service-account" {
  project      = var.project_id
  account_id   = var.account_id
  display_name = var.account_id
}
resource "google_project_iam_member" "project_iam_additive" {
  for_each = var.roles
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.service-account.email}"
}

resource "google_service_account_key" "google_service_account_key" {
  count              = var.service_accounts_keys ? 1 : 0
  service_account_id = google_service_account.service-account.name
  private_key_type   = var.private_key_type

  depends_on = [google_service_account.service-account]
}

resource "google_secret_manager_secret" "secret" {
  count     = var.service_accounts_keys ? 1 : 0
  project   = var.project_id
  secret_id = var.account_id

  labels = {
    tools     = "terraform"
    create_by = "xxx-xx-xx"
    req       = "req-xxx"
    type      = "service-account-json"
  }

  replication {
    auto {}
  }

}

resource "google_secret_manager_secret_version" "secret-version" {
  count  = var.service_accounts_keys ? 1 : 0
  secret = google_secret_manager_secret.secret[count.index].id

  secret_data = base64decode(google_service_account_key.google_service_account_key[0].private_key)

  depends_on = [google_secret_manager_secret.secret]
}