module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name                = var.project_name
  org_id              = var.org_id
  folder_id           = var.managed_folder
  billing_account     = var.billing_account
}