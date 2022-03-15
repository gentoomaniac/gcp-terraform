variable "project_name" {
    type        = string
    description = "GCP project for the Grafana BQ connection"
    default     = "gentoomaniac-tf-test1"
}

variable "managed_folder" {
    type = string
    description = "ID of the folder to put managed projects in"
    default = "1001767313364"
}

variable "ORG_ID" {
    type        = string
    description = "Organisation ID"
}

variable "BILLING_ACCOUNT" {
    type        = string
    description = "Billing account"
}
