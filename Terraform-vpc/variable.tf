variable "region" {
  description = "aws region"
  type        = string
  
}

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
  default = [ "publicsubnet-1" , "publicsubnet-2" ]
}

variable "instance-names" {
  description = "names of all instances"
  type = list(string)
}