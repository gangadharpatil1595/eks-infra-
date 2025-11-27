
resource "aws_security_group" "jump" {
  name        = "${var.env}-jump-sg"
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # tighten later
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jump" {
  ami                    = "ami-0e742cca61fb65051" # change to latest in your region
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.jump.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.env}-jump-server"
  }
}

output "public_ip" {
  value = aws_instance.jump.public_ip
}
