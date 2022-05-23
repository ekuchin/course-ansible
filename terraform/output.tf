output "ansible_instance_ip_addr" {
  value = [ for elem in module.ansible.instance_ip_addr : elem ]
}

output "remote_instance_ip_addr" {
  value = [ for elem in module.remote.instance_ip_addr : elem ]
}