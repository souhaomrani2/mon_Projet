terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url         = var.pm_api_url
  pm_api_token_id    = var.pm_user
  pm_api_token_secret = var.pm_password
  pm_tls_insecure    = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = "ubuntu-vm"
  target_node = var.target_node

  # Configuration du disque
  disks {
    storage      = var.target_storage
    disk_size    = "2G" # Taille du disque
    scsi         = true
    storage_type = "lvm" # Type de stockage
  }

  os_type = var.os_type
}
