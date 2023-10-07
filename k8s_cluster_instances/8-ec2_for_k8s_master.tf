# Filter ami dynamically
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "k8s_master" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.k8s_master_instance_type
  key_name        = "k8s_key"
  security_groups = ["k8s_sg"]
  depends_on      = [aws_security_group.this]
  tags = {
    Name = "k8s_master"
  }
}