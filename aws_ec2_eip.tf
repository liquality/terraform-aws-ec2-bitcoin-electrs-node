# ------------------------------------------------------------------------------
# Elastic IP (for EC2)
# ------------------------------------------------------------------------------
# resource "aws_eip" "lb" {
#   instance = aws_instance.main.id
#   vpc      = true
#
#   tags = merge(
#     local.tags,
#     {
#       Name = local.node_alias
#     }
#   )
# }
