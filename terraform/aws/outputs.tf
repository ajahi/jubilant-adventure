# aws/outputs.tf

output "aws_instance_ip" {
  value = aws_instance.example.public_ip
}

