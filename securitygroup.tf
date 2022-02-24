# 6 Security group to allow port 22,80,443

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["()"]
    ipv6_cidr_blocks = ["()"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["()"]
    ipv6_cidr_blocks = ["()"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["()"]
    ipv6_cidr_blocks = ["()"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["()"]
    ipv6_cidr_blocks = ["()"]
  }

  tags = {
    Name = "allow_WEB"
  }
}
