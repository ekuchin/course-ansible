output "instance_ip_addr" {
  value = [ for inst in openstack_compute_instance_v2.instance : inst.access_ip_v4 ]
}