# 2.internet Gateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.prod_vpc.id


}
# 3.route table

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }


  tags = {
    Name = "prod_routetable"
  }
}

# 4. subnet_1


resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.1.0/25"

  tags = {
    Name = "subnet_1"
  }
}

# 5. Associate Subnet with route Table

resource "aws_route_table_association" "subnet_1_route_table" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table.id
}



#7 network interface with an ip in the subnet

resource "aws_network_interface" "webserver_nic" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_ssh.id]

}

#8 Assign elastic IP to the network interface

resource "aws_eip" "elastic_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.webserver_nic.id
  associate_with_private_ip = "10.0.1.50"

  depends_on = [aws_internet_gateway.internet_gateway]
}
