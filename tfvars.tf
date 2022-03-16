variable "managed_folder" {
    type = string
    description = "ID of the folder to put managed projects in"
}

variable "org_id" {
    type        = string
    description = "Organisation ID"
}

variable "billing_account" {
    type        = string
    description = "Billing account"
}

variable "projects" {
    type = map(any)
    description = "GCP project data"
  
}
