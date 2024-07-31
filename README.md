# Terraform Google Service Account Module
This module manages the creation of a Google Service Account, its associated keys, and the binding of roles dynamically. It also manages storing the service account key in Google Secret Manager if required.

## Usage
To use this module, include the following in your Terraform configuration:

```
module "iam" {
  source = "git@github.com:thisiscaetano/Terraform.git//GCP/Module/iam"

  project_id            = var.project_id
  account_id            = var.account_id
  secret_id             = var.account_id
  service_accounts_keys = true #Caso queira gerar uma chave (json), caso contrário, deixe false
  roles = {
    "roles/viewer" = null
    # Adicione mais roles conforme necessário
  }
}

```
```
variable "project_id" {
  description = "The project ID to use for resources"
  default = ""
}
variable "account_id" {
  description = "The account ID to use for resources"
  default = ""
}

```
## Inputs

| Name                    | Description                                     | Type         | Default | Required |
|-------------------------|-------------------------------------------------|--------------|---------|----------|
| `project_id`            | The ID of the project in which to create the resources | `string` | n/a     | yes   |
| `account_id`            | The ID of the service account                   | `string`     | n/a     | yes      |
| `display_name`          | The display name of the service account         | `string`     | n/a     | yes      |
| `private_key_type`      | The type of the private key                     | `string`     | n/a     | yes      |
| `secret_id`             | The ID of the secret                            | `string`     | n/a     | yes      |
| `service_accounts_keys` | Flag to create service account keys             | `bool`       | `false` | no       |
| `roles`                 | A map of roles to bind to the service account   | `map(string)`| `{}`    | no       |

## Outputs

| Name                      | Description                                             |
|---------------------------|---------------------------------------------------------|
| `service_account_email`   | The email of the service account                        |
| `service_account_key_id`  | The ID of the service account key (if created)          |
| `secret_id`               | The ID of the secret in Secret Manager                  |

## Resources Created
This module will create the following resources:

- `google_service_account`
- `google_service_account_key` (conditionally based on `service_accounts_keys` flag)
- `google_secret_manager_secret`
- `google_secret_manager_secret_version` (conditionally based on `service_accounts_keys` flag)
- `google_project_iam_member` (dynamically based on the `roles` map)

## Authors
Create by Platform team of Group Carrefour Brasil