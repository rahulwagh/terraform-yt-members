resource "aws_instance" "ec2_example_euc1" {
  ami           = "ami-01e444924a2233b07"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
  security_groups = [aws_security_group.web_sg.name]
  key_name        = "aws_key"
}

resource "aws_instance" "ec2_example_eun1" {
  provider = aws.eun1
  ami           = "ami-01e444924a2233b07"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
  security_groups = [aws_security_group.web_sg.name]
  key_name        = "aws_key"
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound traffic on ports 22 and 80"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH from anywhere, consider limiting this
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allows all outbound traffic
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbF6KSNj6jieIUVsvosVPAg0WQSaYlupg5cQ7+DqA6VQKum4eycOar4wdIzON0ExD2cc7hWUA2SYAAIQ33Cy7/BI4DQDDjMMU1CjLOgWoN3xWzWSdxGGs8Gl3OLvBv/UCwBQfV7OALO4hwqtZPo74VoRXXusHnfdLoE9xZ6AVqdjTZzZ7nqFcVM4SQHHJAxLAWtSXRQSV+pXvZ8hb42csPdg5dv+EhluTSDWQ71zdsX8n+F1ibU0xT+JJqGWX7rPZ3Y7LYUxvRm3OAikhEXQNs0NIuXa86AKYdXqQ88kuxXERsPL36A4QwcMb1mOh9w0Sp0HQild82ugNjJSr00bgVzDO1004/C7BfGLJYhjhgXGa7G/fv44IUStVD4SCPcet84QzD6L00nRzzGr03EcFVGXo/idnG23BLQHzcMqVLRaL4UETkT2RTA+nQAyRn8NfNo/SZlmgDpgi3ZQk6QI5HouSdB15MRpKEg9m7UiliBus9ccDYc82yACzkWTrwvmk= rahulwagh@Rahuls-MacBook-Pro-2.local"
}

output "fetched_info_from_aws_euc1" {
  value = format("%s%s","ssh -i demo-key ubuntu@",aws_instance.ec2_example_euc1.public_ip)
}
output "fetched_info_from_aws_eun1" {
  value = format("%s%s","ssh -i demo-key ubuntu@",aws_instance.ec2_example_eun1.public_ip)
}