# # AWS Load Balancer
# resource "aws_alb" "aman-alb" {
#   name            = "aman-alb"
#   subnets = var.subnets-alb
#   security_groups = [var.sg-alb]
#   internal = false
#   load_balancer_type = "application"
# }

# # Listner
# resource "aws_lb_listener" "lb-Listner" {
#   load_balancer_arn = aws_alb.aman-alb.arn
#   port = 80
#   protocol = "HTTP"

#   default_action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.tg.arn
#   }
# }

# # Target Group
# resource "aws_lb_target_group" "tg" {
#   name     = "aman-tg"
#   port = 80
#   protocol = "HTTP"
#   vpc_id = var.vpc-id
# }

# # Target Group Attachment
# resource "aws_lb_target_group_attachment" "tg-attachment" {
#     count = length(var.Instance-id)
#     target_group_arn = aws_lb_target_group.tg.arn
#     target_id = var.Instance-id[count.index]
#     port = 80
# }

# ALB
resource "aws_lb" "alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg-alb]
  subnets            = var.subnets-alb
}

# Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.Instance-id)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.Instance-id[count.index]
  port             = 80
}
