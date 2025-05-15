variable "ec2-sg" {
  description = "security grop for instance"
  type = string
}

variable "subnets" {
  description = "subnets for instance"
  type = list(string)
}

variable "instance-names" {
  description = "names of all instances"
  type = list(string)
}