module "gcp-managed-project" {
    source = "./gcp-managed-project"

    for_each = var.projects

    org_id = var.org_id
    project_name = each.key
    region = each.value.region
    managed_folder = var.managed_folder
    billing_account = var.billing_account
    alert_email = "alerts+${each.key}@siebecke.se"
}