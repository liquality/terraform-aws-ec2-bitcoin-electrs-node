# ------------------------------------------------------------------------------
# Load Balancer
# ------------------------------------------------------------------------------
resource "aws_alb" "main" {
  name               = local.node_alias
  load_balancer_type = "application"
  subnets            = [data.terraform_remote_state.vpc.outputs.public_subnets[0]] # availability zone: a

  security_groups = [
    data.terraform_remote_state.vpc.outputs.sg_http_80_id # port 80
  ]

  internal = false

  tags = local.tags
}

# ------------------------------------------------------------------------------
# Listener / Target Group
# ------------------------------------------------------------------------------
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_alb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group" "main" {
  name        = local.node_alias
  port        = 3000 # electrs rpc
  protocol    = "HTTP"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type = "ip"

  depends_on = [aws_alb.main]

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30 # seconds
    timeout             = 10 # seconds
    matcher             = "200"
    path                = "/blocks/tip/height"
    port                = 3000
  }

  tags = local.tags
}
