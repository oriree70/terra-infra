
# Resource Block
resource "aws_instance" "jenkins_server" {
  ami             = data.aws_ami.amzUbuntu.id
  instance_type   = var.instance_type
  #count           = 1
  key_name        = var.instance_keypair
  subnet_id       = var.myinstance_sub
  security_groups = [var.instance_sg]

  tags = {
    Name = var.instance_tag
  } 

}



