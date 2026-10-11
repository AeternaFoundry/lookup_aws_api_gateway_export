variable "api_gateway_export_lookup" {
  description = <<EOT
Map of api_gateway_export_lookup, attributes below
Required:
    - export_type
    - rest_api_id
    - stage_name
Optional:
    - accepts
    - parameters
    - region
EOT

  type = map(object({
    export_type = string
    rest_api_id = string
    stage_name  = string
    accepts     = optional(string)
    parameters  = optional(map(string))
    region      = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_gateway_export_lookup : (
        v.accepts == null || (contains(["application/json", "application/yaml"], v.accepts))
      )
    ])
    error_message = "must be one of: application/json, application/yaml"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_gateway_export_lookup : (
        contains(["oas30", "swagger"], v.export_type)
      )
    ])
    error_message = "must be one of: oas30, swagger"
  }
}

