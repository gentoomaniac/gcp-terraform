module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name                = var.project_name
  random_project_id   = true
  org_id              = var.ORG_ID
  folder_id           = var.managed_folder
  billing_account     = var.BILLING_ACCOUNT
}