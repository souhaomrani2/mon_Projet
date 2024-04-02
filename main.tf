resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = "ubuntu-vm"
  target_node = var.target_node

  # Configuration du disque
  disks {
    storage            = var.target_storage
    size               = "2G" # Taille du disque
    type               = "scsi"
    storage_type       = "lvm" # Type de stockage
    backup             = true
    cache              = "none"
    iothread           = 0
    replicate          = 0
    ssd                = 0
    iops               = 0
    iops_max           = 0
    iops_rd            = 0
    iops_rd_max        = 0
    iops_wr            = 0
    iops_wr_max        = 0
    mbps               = 0
    mbps_rd            = 0
    mbps_rd_max        = 0
    mbps_wr            = 0
    mbps_wr_max        = 0
  }

  # Configuration de l'image ISO
  cdrom {
    file   = var.iso_file_path # Chemin vers le fichier ISO
    storage = var.cdrom_storage # Stockage pour l'image ISO
  }

  os_type = var.os_type
}
