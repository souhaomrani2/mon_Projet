variable "template" {
  description = "Nom du modèle de machine virtuelle"
  type        = string
  default     = "101"  # Remplacez par l'ID de votre modèle de machine virtuelle sur PVE
}

variable "pm_token" {
  description = "Token d'authentification Proxmox"
  type        = string
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
  pm_token        = var.pm_token  # Utilisation de la variable pour le jeton d'authentification
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  template        = var.template  # Utilisation de la variable pour le modèle de machine virtuelle
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
