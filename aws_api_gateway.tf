# # ------------------------------------------------------------------------------
# # The API Gateway instance
# # ------------------------------------------------------------------------------
# resource "aws_api_gateway_rest_api" "main" {
#   name        = local.node_alias
#   description = "RPC Access for Bitcoin and Electrs"
# }
#
# # ------------------------------------------------------------------------------
# # The API Gateway deployment settings
# # ------------------------------------------------------------------------------
# resource "aws_api_gateway_deployment" "main" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   stage_name  = var.env_alias
#
#   depends_on = [aws_api_gateway_integration.electrs_rpc]
# }
#
# # ------------------------------------------------------------------------------
# # Electrs RPC - API Gateway proxy (method + resource + integration)
# # ------------------------------------------------------------------------------
# resource "aws_api_gateway_resource" "electrs_rpc" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   parent_id   = aws_api_gateway_rest_api.main.root_resource_id
#   path_part   = "{proxy+}"
# }
#
#
# resource "aws_api_gateway_method" "electrs_rpc" {
#   rest_api_id   = aws_api_gateway_rest_api.main.id
#   resource_id   = aws_api_gateway_resource.electrs_rpc.id
#   http_method   = "ANY"
#   authorization = "NONE"
#
#   request_parameters = {
#     "method.request.path.proxy" = true
#   }
# }
#
# resource "aws_api_gateway_integration" "electrs_rpc" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   resource_id = aws_api_gateway_resource.electrs_rpc.id
#   http_method = aws_api_gateway_method.electrs_rpc.http_method
#
#   # Proxy all uri paths
#   type                    = "HTTP_PROXY"
#   integration_http_method = "ANY"
#   uri                     = "http://${aws_eip.lb.public_ip}:3000/{proxy}"
#
#   request_parameters = {
#     "integration.request.path.proxy" = "method.request.path.proxy"
#   }
# }
