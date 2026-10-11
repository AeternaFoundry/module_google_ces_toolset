output "ces_toolsets_id" {
  description = "Map of id values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no id are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ces_toolsets_app" {
  description = "Map of app values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no app are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.app if v.app != null && length(v.app) > 0 }
}
output "ces_toolsets_connector_toolset" {
  description = "Map of connector_toolset values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no connector_toolset are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => one(v.connector_toolset) if v.connector_toolset != null && length(v.connector_toolset) > 0 }
}
output "ces_toolsets_create_time" {
  description = "Map of create_time values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no create_time are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "ces_toolsets_deletion_policy" {
  description = "Map of deletion_policy values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no deletion_policy are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "ces_toolsets_description" {
  description = "Map of description values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no description are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.description if v.description != null && length(v.description) > 0 }
}
output "ces_toolsets_display_name" {
  description = "Map of display_name values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no display_name are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "ces_toolsets_etag" {
  description = "Map of etag values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no etag are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "ces_toolsets_execution_type" {
  description = "Map of execution_type values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no execution_type are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.execution_type if v.execution_type != null && length(v.execution_type) > 0 }
}
output "ces_toolsets_location" {
  description = "Map of location values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no location are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.location if v.location != null && length(v.location) > 0 }
}
output "ces_toolsets_mcp_toolset" {
  description = "Map of mcp_toolset values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no mcp_toolset are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => one(v.mcp_toolset) if v.mcp_toolset != null && length(v.mcp_toolset) > 0 }
}
output "ces_toolsets_name" {
  description = "Map of name values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no name are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ces_toolsets_open_api_toolset" {
  description = "Map of open_api_toolset values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no open_api_toolset are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => one(v.open_api_toolset) if v.open_api_toolset != null && length(v.open_api_toolset) > 0 }
}
output "ces_toolsets_project" {
  description = "Map of project values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no project are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.project if v.project != null && length(v.project) > 0 }
}
output "ces_toolsets_timeout" {
  description = "Map of timeout values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no timeout are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.timeout if v.timeout != null && length(v.timeout) > 0 }
}
output "ces_toolsets_tool_fake_config" {
  description = "Map of tool_fake_config values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no tool_fake_config are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => one(v.tool_fake_config) if v.tool_fake_config != null && length(v.tool_fake_config) > 0 }
}
output "ces_toolsets_toolset_id" {
  description = "Map of toolset_id values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no toolset_id are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.toolset_id if v.toolset_id != null && length(v.toolset_id) > 0 }
}
output "ces_toolsets_update_time" {
  description = "Map of update_time values across all ces_toolsets, keyed the same as var.ces_toolsets except keys with no update_time are omitted"
  value       = { for k, v in google_ces_toolset.ces_toolsets : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

