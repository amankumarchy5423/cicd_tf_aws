output "vpc_id" {
  value = aws_vpc.aman-vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnets.*.id
}