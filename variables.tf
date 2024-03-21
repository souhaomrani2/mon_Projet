variable "pm_api_url" {
  description = ""
}

variable "pm_user" {
  description = ""
}

variable "pm_password" {
  description = ""
}

variable "target_node" {
  description = "Name of the Proxmox node"
}

variable "target_storage" {
  description = "Name of the Proxmox storage"
}

variable "bridge" {
  description = "Name of the bridge network"
}

variable "disk_size" {
  description = "Size of the disk for the VM"
}

variable "os_type" {
  description = "Type of the operating system"
}
