output "instances" {
  value = aws_instance.aman-vpc-server.*.id
}

output "instance_ips" {
  value = aws_instance.aman-vpc-server.*.public_ip
}