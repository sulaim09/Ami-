provider "aws" {
  # Configuration options
  region     = "us-east-1"
  access_key = "AKIA43YMUKVDNMQ3WP6U"
  secret_key = "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"
}

# 5-videos / How to  create AMI -there are 4 ways by Terraform ?
# F-M 1. Create snapshot of root volume form Instace and WILL create  aim form thats snapshots ?
# S-M 2. How to copy AIM one Regions to another region ?
# T-M 3. Directly create Inatnce aim and bakendly Manage that ?
# Fr-M 4. How to permission or authorization to AMI another AWS Account ?


# 1. practical step - already created instance and take snapshot- for root Volume of Instance / It is assumed that such a snapshot
# already exists with the id "snap-xxxxxxxx".

/*
resource "aws_ami" "example" {
  name                = "terraform-example"  # mentioned name here of AIM 
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "snap-07e966c95da0d3711" # mentioned snapshot -id
    volume_size = 8 # mentioned volume-size thats snapshots & check consol
  }
}
*/

# 2. Resource: aws_ami_copy / How to copy AIM one Regions to another region ? /most imprtants thing source and destions check 
/*
resource "aws_ami_copy" "amicopy" {
  name              = "myaim"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-0511b38ec31112881" # mentioned AMI id for copy 
  source_ami_region = "us-east-1" # becarefull - mentioned source and destination change in provider

  tags = {
    Name = "my-us-esat-1-aim-to-west-1"
  }
}
*/

# How to create AMI form Instance?
resource "aws_ami_from_instance" "example" {
  name               = "hpaim"
  source_instance_id = "i-06332c37c6bb68d7c"
}