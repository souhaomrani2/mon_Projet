resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = "ubuntu-vm"
  target_node = var.target_node

  network {
    model   = "virtio"
    bridge  = var.bridge
  }

  disk {
    storage  = var.target_storage
    size     = var.disk_size
    type     = "scsi"
  }

  cdrom {
    storage = var.target_storage
    file    = var.iso
  }

  os_type = var.os_type
}
