variable "vpc_cidr" {
  description = "vpc ip range"
  type = string
}

variable "subnet_cidr" {
  description = "subnet ip range"
  type = list(string)
}

variable "subnet_name" {
  description = "this varible contain different subnet name"
  type = list(string)
  
}