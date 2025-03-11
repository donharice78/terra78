data "aws_ami" "amiID" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "instances_id" {
  description = "AMI ID of unbundl instances"
  value       = data.aws_ami.amiID.id
}

