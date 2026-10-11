variable "ces_toolsets" {
  description = <<EOT
Map of ces_toolsets, attributes below
Required:
    - app
    - location
    - toolset_id
Optional:
    - deletion_policy
    - description
    - display_name
    - execution_type
    - project
    - timeout
    - connector_toolset (block):
        - auth_config (optional, block):
            - oauth2_auth_code_config (optional, block):
                - oauth_token (required)
            - oauth2_jwt_bearer_config (optional, block):
                - client_key (required)
                - issuer (required)
                - subject (required)
        - connection (required)
        - connector_actions (required, block):
            - connection_action_id (optional)
            - entity_operation (optional, block):
                - entity_id (required)
                - operation (required)
            - input_fields (optional)
            - output_fields (optional)
    - mcp_toolset (block):
        - api_authentication (optional, block):
            - api_key_config (optional, block):
                - api_key_secret_version (required)
                - key_name (required)
                - request_location (required)
            - bearer_token_config (optional, block):
                - token (optional)
            - oauth_config (optional, block):
                - client_id (required)
                - client_secret_version (required)
                - oauth_grant_type (required)
                - scopes (optional)
                - token_endpoint (required)
            - service_account_auth_config (optional, block):
                - scopes (optional)
                - service_account (required)
            - service_agent_id_token_auth_config (optional, block):
        - custom_headers (optional)
        - server_address (required)
        - service_directory_config (optional, block):
            - service (required)
        - tls_config (optional, block):
            - ca_certs (required, block):
                - cert (required)
                - display_name (required)
        - tool_overrides (optional, block):
            - description_override (optional)
            - name_override (optional)
            - tool (required)
    - open_api_toolset (block):
        - api_authentication (optional, block):
            - api_key_config (optional, block):
                - api_key_secret_version (required)
                - key_name (required)
                - request_location (required)
            - bearer_token_config (optional, block):
                - token (optional)
            - oauth_config (optional, block):
                - client_id (required)
                - client_secret_version (required)
                - oauth_grant_type (required)
                - scopes (optional)
                - token_endpoint (required)
            - service_account_auth_config (optional, block):
                - scopes (optional)
                - service_account (required)
            - service_agent_id_token_auth_config (optional, block):
        - ignore_unknown_fields (optional)
        - open_api_schema (required)
        - service_directory_config (optional, block):
            - service (required)
        - tls_config (optional, block):
            - ca_certs (required, block):
                - cert (required)
                - display_name (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - tool_fake_config (block):
        - code_block (optional, block):
            - python_code (required)
        - enable_fake_mode (optional)
EOT

  type = map(object({
    app             = string
    location        = string
    toolset_id      = string
    deletion_policy = optional(string)
    description     = optional(string)
    display_name    = optional(string)
    execution_type  = optional(string)
    project         = optional(string)
    timeout         = optional(string)
    connector_toolset = optional(object({
      auth_config = optional(object({
        oauth2_auth_code_config = optional(object({
          oauth_token = string
        }))
        oauth2_jwt_bearer_config = optional(object({
          client_key = string
          issuer     = string
          subject    = string
        }))
      }))
      connection = string
      connector_actions = list(object({
        connection_action_id = optional(string)
        entity_operation = optional(object({
          entity_id = string
          operation = string
        }))
        input_fields  = optional(list(string))
        output_fields = optional(list(string))
      }))
    }))
    mcp_toolset = optional(object({
      api_authentication = optional(object({
        api_key_config = optional(object({
          api_key_secret_version = string
          key_name               = string
          request_location       = string
        }))
        bearer_token_config = optional(object({
          token = optional(string)
        }))
        oauth_config = optional(object({
          client_id             = string
          client_secret_version = string
          oauth_grant_type      = string
          scopes                = optional(list(string))
          token_endpoint        = string
        }))
        service_account_auth_config = optional(object({
          scopes          = optional(list(string))
          service_account = string
        }))
        service_agent_id_token_auth_config = optional(object({
        }))
      }))
      custom_headers = optional(map(string))
      server_address = string
      service_directory_config = optional(object({
        service = string
      }))
      tls_config = optional(object({
        ca_certs = list(object({
          cert         = string
          display_name = string
        }))
      }))
      tool_overrides = optional(list(object({
        description_override = optional(string)
        name_override        = optional(string)
        tool                 = string
      })))
    }))
    open_api_toolset = optional(object({
      api_authentication = optional(object({
        api_key_config = optional(object({
          api_key_secret_version = string
          key_name               = string
          request_location       = string
        }))
        bearer_token_config = optional(object({
          token = optional(string)
        }))
        oauth_config = optional(object({
          client_id             = string
          client_secret_version = string
          oauth_grant_type      = string
          scopes                = optional(list(string))
          token_endpoint        = string
        }))
        service_account_auth_config = optional(object({
          scopes          = optional(list(string))
          service_account = string
        }))
        service_agent_id_token_auth_config = optional(object({
        }))
      }))
      ignore_unknown_fields = optional(bool)
      open_api_schema       = string
      service_directory_config = optional(object({
        service = string
      }))
      tls_config = optional(object({
        ca_certs = list(object({
          cert         = string
          display_name = string
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    tool_fake_config = optional(object({
      code_block = optional(object({
        python_code = string
      }))
      enable_fake_mode = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ces_toolsets : (
        v.connector_toolset == null || (length(v.connector_toolset.connector_actions) >= 1)
      )
    ])
    error_message = "Each connector_actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_toolsets : (
        v.mcp_toolset == null || (v.mcp_toolset.tls_config == null || (length(v.mcp_toolset.tls_config.ca_certs) >= 1))
      )
    ])
    error_message = "Each ca_certs list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_toolsets : (
        v.open_api_toolset == null || (v.open_api_toolset.tls_config == null || (length(v.open_api_toolset.tls_config.ca_certs) >= 1))
      )
    ])
    error_message = "Each ca_certs list must contain at least 1 items"
  }
}

