variable "subnets-alb" {
  type        = list(string)
  description = "The name of the AWS Load Balancer"
}

variable "sg-alb" {
  type = string
  description = "the id pf sg for alb"
}

variable "vpc-id" {
  description = "vpc-id for the alb"
  type = string
}

variable "Instance-id" {
  description = "instance id for the alb"
  type = list(string)
}