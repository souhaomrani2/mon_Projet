variable "template" {
  description = "Nom du modèle de machine virtuelle"
  type        = string
  default     = "101"  # Remplacez par l'ID de votre modèle de machine virtuelle sur PVE
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_token        = var.pm_token
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  template        = var.template
  target_node     = var.target_node
  full_clone      = true
  network {
    model   = "virtio"
    bridge  = var.bridge
  }
  
  disk {
    storage  = var.target_storage
    size     = var.disk_size
    type     = "scsi"
  }
  
  os_type = var.os_type
}
