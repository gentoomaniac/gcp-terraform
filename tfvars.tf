variable "gcp_project_name" {
    type        = string
    description = "GCP project for the Grafana BQ connection"
}

variable "gcp_region" {
    type        = string
    description = "GCP pregion"
}

variable "managed_folder" {
    type = string
    description = "ID of the folder to put managed projects in"
}

variable "ORG_ID" {
    type        = string
    description = "Organisation ID"
}

variable "BILLING_ACCOUNT" {
    type        = string
    description = "Billing account"
}

variable "alerts" {
  type = map(any)
  description = "Alert definitions"
}
