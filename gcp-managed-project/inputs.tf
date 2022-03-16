variable "project_name" {
    type        = string
    description = "GCP project for the Grafana BQ connection"
}

variable "region" {
    type        = string
    description = "GCP pregion"
}

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

variable "alert_email" {
  type = string
  description = "Email to send alerts to"
}

variable "audit_alerts" {
  type = map(any)
  description = "Alert definitions"
  default = {
    "gcs_iam_changes" : {
      description : "GCS IAM permission changes",
      filter : "resource.type=gcs_bucket AND protoPayload.methodName=\"storage.setIamPermissions\"",
    },
    "project_ownership_and_assignment_changes" : {
      description : "Project ownership and assignment changes",
      filter : "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\") AND (ProjectOwnership OR projectOwnerInvitee) OR (protoPayload.serviceData.policyDelta.bindingDeltas.action=\"REMOVE\" AND protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\") OR (protoPayload.serviceData.policyDelta.bindingDeltas.action=\"ADD\" AND protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\")",
    },
    "firewall_changes" : {
      description : "Firewall rule changes",
      filter : "resource.type=\"gce_firewall_rule\" AND jsonPayload.event_subtype=\"compute.firewalls.patch\" OR jsonPayload.event_subtype=\"compute.firewalls.insert\"",
    },
    "audit_config_changes" : {
      description : "Audit configuration changes",
      filter : "protoPayload.methodName=\"SetIamPolicy\" AND protoPayload.serviceData.policyDelta.auditConfigDeltas:*",
    },
    "custom_role_changes" : {
      description : "Custom role changes",
      filter : "resource.type=\"iam_role\" AND protoPayload.methodName=\"google.iam.admin.v1.CreateRole\" OR protoPayload.methodName=\"google.iam.admin.v1.DeleteRole\" OR protoPayload.methodName=\"google.iam.admin.v1.UpdateRole\"",
    },
    "sql_instance_changes" : {
      description : "SQL instance configuration changes",
      filter : "protoPayload.methodName=\"cloudsql.instances.update\"",
    },
    "vpc_route_changes" : {
      description : "VPC routing changes",
      filter : "protoPayload.methodName=\"cloudsql.instances.update\"",
    },
    "vpc_network_changes" : {
      description : "VPC network changes",
      filter : "resource.type=gce_network AND jsonPayload.event_subtype=\"compute.networks.insert\" OR jsonPayload.event_subtype=\"compute.networks.patch\" OR jsonPayload.event_subtype=\"compute.networks.delete\" OR jsonPayload.event_subtype=\"compute.networks.removePeering\" OR jsonPayload.event_subtype=\"compute.networks.addPeering\""
    }
  }
}