resource "google_compute_project_metadata" "os-login" {
  metadata = {
    enable-oslogin = "TRUE"
  }
  project     = var.project_name
}