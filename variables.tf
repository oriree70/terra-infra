# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

# AWS EC2 Instance AMI
/*variable "ec2_ami" {
  description = "EC2 Instance AMI"
  type        = string
  default     = "ami-06aa3f7caf3a30282"
} */

# AWS EC2 Instance Type
/*variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
  

}
*/



# Define a Map for AWS EC2 instance types
variable "instance_type" {
  description = "A map of instance types for each EC2 Instance"
  type        = string
  default     = "t2.medium"
}

# Define a map for instance tags
variable "instance_tag" {
  description = "A map of tags to apply to each EC2 instance"
  type        = string
  default     = "jenkinsServer" 
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
  default     = "maykey"
}

# AWS EC2 Instance Security Group
variable "instance_sg" {
  description = "This is the security group for the instance"
  type        = string
  default     = "sg-0c0c55c629a0332c9"

}

# AWS EC2 Instance Security Group
variable "myinstance_sub" {
  description = "This is the VPC subnet for the instance"
  type        = string
  default     = "subnet-02ac27d034006dae8"

} 
