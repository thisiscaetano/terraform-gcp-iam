module "iam" {
  source = "git@bitbucket.org:carrefour_ecommerce/module-tf.git//iam_v2"

  project_id            = var.project_id
  account_id            = var.account_id
  secret_id             = var.account_id
  service_accounts_keys = true #Caso queira gerar uma chave (json), caso contrário, deixe false
  roles = {
    "roles/viewer" = null
    # Adicione mais roles conforme necessário
  }
}