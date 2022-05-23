variable "image_id" {
  default = "d853edd0-27b3-4385-a380-248ac8e40956"
}

variable "image_name" {
  default = "Ubuntu-20.04.1-202008"
}

variable "flavor_name" {
  default = "Basic-1-1-10"
}

variable "password" {
  //  default = ""
sensitive = true
}

variable "instance_name" {
  default = ""
}

variable "instance_count" {
  default = 1
}

locals {
  project_id="73c38e3fc3d04e6cb5949b222a673c8f"
}