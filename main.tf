data "aws_api_gateway_export" "api_gateway_export_lookup" {
  for_each = var.api_gateway_export_lookup

  export_type = each.value.export_type
  rest_api_id = each.value.rest_api_id
  stage_name  = each.value.stage_name
  accepts     = each.value.accepts
  parameters  = each.value.parameters
  region      = each.value.region
}

