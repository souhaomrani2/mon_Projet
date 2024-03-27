variable "template" {
  description = "Nom du modèle de machine virtuelle"
  type        = string
  default     = "101"  # Remplacez la valeur par l'ID de votre modèle de machine virtuelle sur PVE
}

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_token        = var.pm_token  # Utilisation du jeton d'authentification
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  clone           = var.template
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
