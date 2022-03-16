resource "google_logging_metric" "project_ownership_and_assignment_changes" {
  for_each = var.alerts

  description = each.value.description
  filter      = each.value.filter

  metric_descriptor {
    metric_kind = "DELTA"
    unit        = "1"
    value_type  = "INT64"
  }

  name    = each.key
  project = var.gcp_project_name
}

resource "google_monitoring_alert_policy" "alertPolicies-project_ownership_and_assignment_changes" {
  for_each = var.alerts
  combiner = "OR"

  conditions {
    condition_threshold {
      aggregations {
        alignment_period     = "600s"
        cross_series_reducer = "REDUCE_COUNT"
        per_series_aligner   = "ALIGN_DELTA"
      }

      comparison      = "COMPARISON_GT"
      duration        = "0s"
      filter          = format("resource.type=\"metric\" AND metric.type=\"logging.googleapis.com/user/%s\"", each.key)
      threshold_value = "0"

      trigger {
        count   = "1"
        percent = "0"
      }
    }

    display_name = format("logging/user/%s [COUNT]", each.key)
  }

  display_name          = each.value.description
  enabled               = "true"
  project               = var.gcp_project_name
  notification_channels = [google_monitoring_notification_channel.gcp_alert_email.name]
  depends_on            = [google_logging_metric.project_ownership_and_assignment_changes, google_monitoring_notification_channel.gcp_alert_email]
}

resource "google_monitoring_notification_channel" "gcp_alert_email" {
  display_name = "Alert Notifications"
  type         = "email"
  labels = {
    email_address = "alerts+${var.gcp_project_name}@siebecke.se"
  }
}
