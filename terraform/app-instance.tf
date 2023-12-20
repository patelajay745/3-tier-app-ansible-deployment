resource "aws_instance" "app_instance" {

  ami                    = var.ami-id # Specify the AMI ID for your desired Amazon Machine Image
  instance_type          = var.instance_type[2]
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app-instance-sg.id]
  tags = {
    Name = var.instance_names[2]
  }


}





#Create security group 
resource "aws_security_group" "app-instance-sg" {
  name        = "terraform-app-sg"
  description = "Allow inbound ports 22, 8080"
  vpc_id      = var.vpc_id

  #Allow incoming TCP requests on port 22 from any IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Allow incoming TCP requests on port 443 from any IP
  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow incoming TCP requests on port 8080 from any IP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
