resource "random_id" "security_group_suffix" {
  byte_length = 4
}

resource "aws_security_group" "example" {
  name        = "security-group-${random_id.security_group_suffix.hex}"
  description = "Security group with random name"

  ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
}

output "security_group_id" {
  value = aws_security_group.example.id
}