output "k8s_master_public_ip" {
  value = aws_instance.k8s_master.public_ip
}
output "k8s_worker_public_ip" {
  value = aws_instance.k8s_worker[*].public_ip
}