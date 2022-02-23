resource "aws_instance" "terraform_webserver" {
  ami               = "ami-0e472ba40eb589f49"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "access-main-key"


  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.terraform_servernic.id
  }

  user_data = <<-E0f
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                E0f

  tags = {
    Name = "web-server"
  }


}
