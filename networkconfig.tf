# 2.internet Gateway

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.terraform_vpc.id


}
# 3.route table

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "prod_routetable"
  }
}

# 4. Create a subnet


resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_1"
  }
}

# 5. Associate Subnet with route Table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table.id
}



#7 Create a network interface with an ip in the subnet that was created in step 4

resource "aws_network_interface" "servernic" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["()"]
  security_groups = [aws_security_group.allow_web.id]

}

#8 Assign elastic IP to the network interface created in step 7

resource "aws_eip" "elastic_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.servernic.id
  associate_with_private_ip = "()"

  depends_on = [aws_internet_gateway.gateway]
}
