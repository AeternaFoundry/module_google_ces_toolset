resource "google_ces_toolset" "ces_toolsets" {
  for_each = var.ces_toolsets

  app             = each.value.app
  location        = each.value.location
  toolset_id      = each.value.toolset_id
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  display_name    = each.value.display_name
  execution_type  = each.value.execution_type
  project         = each.value.project
  timeout         = each.value.timeout

  dynamic "connector_toolset" {
    for_each = each.value.connector_toolset != null ? [each.value.connector_toolset] : []
    content {
      dynamic "auth_config" {
        for_each = connector_toolset.value.auth_config != null ? [connector_toolset.value.auth_config] : []
        content {
          dynamic "oauth2_auth_code_config" {
            for_each = auth_config.value.oauth2_auth_code_config != null ? [auth_config.value.oauth2_auth_code_config] : []
            content {
              oauth_token = oauth2_auth_code_config.value.oauth_token
            }
          }
          dynamic "oauth2_jwt_bearer_config" {
            for_each = auth_config.value.oauth2_jwt_bearer_config != null ? [auth_config.value.oauth2_jwt_bearer_config] : []
            content {
              client_key = oauth2_jwt_bearer_config.value.client_key
              issuer     = oauth2_jwt_bearer_config.value.issuer
              subject    = oauth2_jwt_bearer_config.value.subject
            }
          }
        }
      }
      connection = connector_toolset.value.connection
      dynamic "connector_actions" {
        for_each = connector_toolset.value.connector_actions
        content {
          connection_action_id = connector_actions.value.connection_action_id
          dynamic "entity_operation" {
            for_each = connector_actions.value.entity_operation != null ? [connector_actions.value.entity_operation] : []
            content {
              entity_id = entity_operation.value.entity_id
              operation = entity_operation.value.operation
            }
          }
          input_fields  = connector_actions.value.input_fields
          output_fields = connector_actions.value.output_fields
        }
      }
    }
  }

  dynamic "mcp_toolset" {
    for_each = each.value.mcp_toolset != null ? [each.value.mcp_toolset] : []
    content {
      dynamic "api_authentication" {
        for_each = mcp_toolset.value.api_authentication != null ? [mcp_toolset.value.api_authentication] : []
        content {
          dynamic "api_key_config" {
            for_each = api_authentication.value.api_key_config != null ? [api_authentication.value.api_key_config] : []
            content {
              api_key_secret_version = api_key_config.value.api_key_secret_version
              key_name               = api_key_config.value.key_name
              request_location       = api_key_config.value.request_location
            }
          }
          dynamic "bearer_token_config" {
            for_each = api_authentication.value.bearer_token_config != null ? [api_authentication.value.bearer_token_config] : []
            content {
              token = bearer_token_config.value.token
            }
          }
          dynamic "oauth_config" {
            for_each = api_authentication.value.oauth_config != null ? [api_authentication.value.oauth_config] : []
            content {
              client_id             = oauth_config.value.client_id
              client_secret_version = oauth_config.value.client_secret_version
              oauth_grant_type      = oauth_config.value.oauth_grant_type
              scopes                = oauth_config.value.scopes
              token_endpoint        = oauth_config.value.token_endpoint
            }
          }
          dynamic "service_account_auth_config" {
            for_each = api_authentication.value.service_account_auth_config != null ? [api_authentication.value.service_account_auth_config] : []
            content {
              scopes          = service_account_auth_config.value.scopes
              service_account = service_account_auth_config.value.service_account
            }
          }
          dynamic "service_agent_id_token_auth_config" {
            for_each = api_authentication.value.service_agent_id_token_auth_config != null ? [api_authentication.value.service_agent_id_token_auth_config] : []
            content {
            }
          }
        }
      }
      custom_headers = mcp_toolset.value.custom_headers
      server_address = mcp_toolset.value.server_address
      dynamic "service_directory_config" {
        for_each = mcp_toolset.value.service_directory_config != null ? [mcp_toolset.value.service_directory_config] : []
        content {
          service = service_directory_config.value.service
        }
      }
      dynamic "tls_config" {
        for_each = mcp_toolset.value.tls_config != null ? [mcp_toolset.value.tls_config] : []
        content {
          dynamic "ca_certs" {
            for_each = tls_config.value.ca_certs
            content {
              cert         = ca_certs.value.cert
              display_name = ca_certs.value.display_name
            }
          }
        }
      }
      dynamic "tool_overrides" {
        for_each = mcp_toolset.value.tool_overrides != null ? mcp_toolset.value.tool_overrides : []
        content {
          description_override = tool_overrides.value.description_override
          name_override        = tool_overrides.value.name_override
          tool                 = tool_overrides.value.tool
        }
      }
    }
  }

  dynamic "open_api_toolset" {
    for_each = each.value.open_api_toolset != null ? [each.value.open_api_toolset] : []
    content {
      dynamic "api_authentication" {
        for_each = open_api_toolset.value.api_authentication != null ? [open_api_toolset.value.api_authentication] : []
        content {
          dynamic "api_key_config" {
            for_each = api_authentication.value.api_key_config != null ? [api_authentication.value.api_key_config] : []
            content {
              api_key_secret_version = api_key_config.value.api_key_secret_version
              key_name               = api_key_config.value.key_name
              request_location       = api_key_config.value.request_location
            }
          }
          dynamic "bearer_token_config" {
            for_each = api_authentication.value.bearer_token_config != null ? [api_authentication.value.bearer_token_config] : []
            content {
              token = bearer_token_config.value.token
            }
          }
          dynamic "oauth_config" {
            for_each = api_authentication.value.oauth_config != null ? [api_authentication.value.oauth_config] : []
            content {
              client_id             = oauth_config.value.client_id
              client_secret_version = oauth_config.value.client_secret_version
              oauth_grant_type      = oauth_config.value.oauth_grant_type
              scopes                = oauth_config.value.scopes
              token_endpoint        = oauth_config.value.token_endpoint
            }
          }
          dynamic "service_account_auth_config" {
            for_each = api_authentication.value.service_account_auth_config != null ? [api_authentication.value.service_account_auth_config] : []
            content {
              scopes          = service_account_auth_config.value.scopes
              service_account = service_account_auth_config.value.service_account
            }
          }
          dynamic "service_agent_id_token_auth_config" {
            for_each = api_authentication.value.service_agent_id_token_auth_config != null ? [api_authentication.value.service_agent_id_token_auth_config] : []
            content {
            }
          }
        }
      }
      ignore_unknown_fields = open_api_toolset.value.ignore_unknown_fields
      open_api_schema       = open_api_toolset.value.open_api_schema
      dynamic "service_directory_config" {
        for_each = open_api_toolset.value.service_directory_config != null ? [open_api_toolset.value.service_directory_config] : []
        content {
          service = service_directory_config.value.service
        }
      }
      dynamic "tls_config" {
        for_each = open_api_toolset.value.tls_config != null ? [open_api_toolset.value.tls_config] : []
        content {
          dynamic "ca_certs" {
            for_each = tls_config.value.ca_certs
            content {
              cert         = ca_certs.value.cert
              display_name = ca_certs.value.display_name
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "tool_fake_config" {
    for_each = each.value.tool_fake_config != null ? [each.value.tool_fake_config] : []
    content {
      dynamic "code_block" {
        for_each = tool_fake_config.value.code_block != null ? [tool_fake_config.value.code_block] : []
        content {
          python_code = code_block.value.python_code
        }
      }
      enable_fake_mode = tool_fake_config.value.enable_fake_mode
    }
  }
}

