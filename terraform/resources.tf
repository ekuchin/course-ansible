module "ansible" {
  source = "./my_instance"
  
  instance_name = "ansible"
  flavor_name = "Basic-1-4-50"
  instance_count = 2
  password = var.password
}

module "remote" {
  source = "./my_instance"
  
  instance_name = "remote"
  flavor_name = "Basic-1-1-10"
  instance_count = 3
  password = var.password
}
