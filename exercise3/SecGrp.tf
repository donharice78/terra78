resource "aws_security_group" "dove-sg" {
  name        = "dove-sg"
  description = "dove-sg"
  tags = {
    Name = "dove-sg"
  }
}

# Allow SSH from specific IP
resource "aws_security_group_rule" "sshFromMyIP" {
  type              = "ingress"
  security_group_id = aws_security_group.dove-sg.id
  cidr_blocks       = ["193.186.4.55/32"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# Allow HTTP from anywhere
resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  security_group_id = aws_security_group.dove-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}

# Allow all outbound traffic (IPv4)
resource "aws_security_group_rule" "allowAllOutbound_ipv4" {
  type              = "egress"
  security_group_id = aws_security_group.dove-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # Allow all protocols
}

# Allow all outbound traffic (IPv6)
resource "aws_security_group_rule" "allowAllOutbound_ipv6" {
  type              = "egress"
  security_group_id = aws_security_group.dove-sg.id
  ipv6_cidr_blocks  = ["::/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # Allow all protocols
}
