resource "openstack_compute_keypair_v2" "ssh" {
  # Название ssh ключа,
  # Данный ключ будет отображаться в разделе
  # Облачные вычисления -> Ключевые пары
  name = "terraform_ssh_key"
  
  # Путь до публичного ключа
  # В примере он находится в одной директории с main.tf
  public_key = file("${path.module}/mcs.pub")
}

resource "openstack_compute_secgroup_v2" "rules" {
  name = "terraform__security_group"
  description = "security group for terraform instance"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_blockstorage_volume_v2" "volume" {
  # Название диска
  name = "storage"
  
  # Тип создаваемого диска
  volume_type = "dp1"
  
  # Размер диска
  size = "10"

  # uuid индикатор образа, в примере используется CentOS-8.4-202107
  image_id = var.image_id #"c9b7a469-a7ed-4119-b840-fd5169ee4348"
}

resource "openstack_compute_instance_v2" "instance" {
  # Название создаваемой ВМ
  name = "madeByTerraform"

  # Имя и uuid образа с ОС
  image_name =  var.image_name #"CentOS-8.4-202107"
  image_id = var.image_name #"c9b7a469-a7ed-4119-b840-fd5169ee4348"
  
  # Конфигурация инстанса
  flavor_name = "Basic-1-1-10"

  # Публичный ключ для доступа
  key_pair = openstack_compute_keypair_v2.ssh.name

  # Указываем, что при создании использовать config drive
  # Без этой опции ВМ не будет создана корректно в сетях без DHCP
  config_drive = true

  # Присваивается security group для ВМ
  security_groups = [
   openstack_compute_secgroup_v2.rules.name
  ]

  # В данном примере используется сеть ext-net
  network {
    name = "ext-net"
  }

  # Блочное устройство
  block_device {
    uuid = openstack_blockstorage_volume_v2.volume.id
    boot_index = 0
    source_type = "volume"
    destination_type = "volume"
    delete_on_termination = true
  }
}
