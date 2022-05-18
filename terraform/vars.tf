
variable "password" {
  //  default = ""
sensitive = true
}


variable "image_id" {
  default = "d853edd0-27b3-4385-a380-248ac8e40956"
}

variable "image_name" {
  default = "Ubuntu-20.04.1-202008"
}

variable "project_id" {
  //значение OS_PROJECT_ID
  default = "73c38e3fc3d04e6cb5949b222a673c8f"
}