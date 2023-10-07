# Create Aws instance  
resource "aws_instance" "k8s_worker" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.k8s_worker_instance_type
  key_name        = "k8s_key"
  security_groups = ["k8s_sg"]
  count           = 2
  depends_on      = [aws_security_group.this]
  tags = {
    Name = "k8s_worker"
  }
}