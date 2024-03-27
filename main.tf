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
  pm_api_url      = "https://192.168.127.134:8006/api2/json"
  pm_token        = "faf0b3f2-8df5-48ec-b726-6fadc60aa5d1"  # Remplacez par votre véritable jeton d'authentification
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  clone           = var.template
  target_node     = "pve"
  full_clone      = true
  network {
    model   = "virtio"
    bridge  = "vmbr0"
  }
  
  disk {
    storage  = "local-lvm"
    size     = "1G"
    type     = "scsi"
  }
  
  os_type = "l26"
}
