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
    storage = var.target_storage
    size    = var.disk_size
    type    = "scsi"
  }

  os_type         = var.os_type

  // Arguments pour l'image ISO
  agent           = true
  boot            = "cdn"
  scsihw          = "virtio-scsi-pci"

  // Démarrage de la machine virtuelle avec l'image ISO
  cdrom           = var.iso_image
}
