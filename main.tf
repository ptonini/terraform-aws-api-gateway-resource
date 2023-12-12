resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.rest_api_id
  parent_id   = var.parent_id
  path_part   = var.path_part
}

module "methods" {
  source             = "ptonini/api-gateway-method/aws"
  version            = "~> 1.0.0"
  for_each           = var.methods
  rest_api_id        = var.rest_api_id
  resource_id        = aws_api_gateway_resource.this.id
  http_method        = each.key
  authorization      = each.value.authorization
  authorizer_id      = each.value.authorizer_id
  request_parameters = each.value.request_parameters
  integrations       = each.value.integrations
}