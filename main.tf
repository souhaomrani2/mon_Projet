variable "template" {
  description = "Nom du modèle de machine virtuelle"
  type        = string
  default     = "template_default_value"  # Valeur par défaut
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
  pm_user         = var.pm_user
  pm_password     = var.pm_password
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
    type     = "scsi" # Ajout de l'argument type requis pour le disque
  }
