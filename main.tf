provider "proxmox" {
  pm_api_url      = "https://192.168.127.134:8006/#v1:0:=qemu%2F100:4:::::8::"
  pm_user         = "root"
  pm_password     = "rootroot"
  pm_tls_insecure = true
}
resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "teste"
  clone           = template
  target_node     = var.target_node
  target_storage  = var.target_storage
  full_clone      = true
  network {
    model   = "virtio"
    bridge  = var.bridge
  }
  disk {
    id       = 0
    storage  = var.target_storage
    size     = var.disk_size
  }
  os_type = var.os_type
}
variable "pm_api_url" {}
variable "pm_user" {}
variable "pm_password" {}
variable "clone_template" {}
variable "target_node" {}
variable "target_storage" {}
variable "bridge" {}
variable "disk_size" {}
variable "os_type" {}
