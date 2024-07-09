# This file is here just to house the output from provision resources
output "public_ip" {

  #value = aws_instance.aws_Server.public_ip
  value = aws_instance.jenkins_server.public_ip
}
