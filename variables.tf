variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  default     = "https://192.168.127.134:8006/api2/json"
}

variable "pm_user" {
  description = "Nom d'utilisateur Proxmox"
  default     = "root@pam!souhasouha"
}

variable "pm_password" {
  description = "Mot de passe Proxmox"
  default     = "faf0b3f2-8df5-48ec-b726-6fadc60aa5d1"
}

variable "target_node" {
  description = "Nom du nœud Proxmox"
  default     = "local(pve)"
}

variable "target_storage" {
  description = "Nom du stockage Proxmox"
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Taille du disque pour la machine virtuelle"
  default     = "2G"
}

variable "storage_type" {
  description = "Type de stockage"
  default     = "lvm"
}

variable "os_type" {
  description = "Type du système d'exploitation"
  default     = "l26"
}

variable "iso" {
  description = "Chemin de l'image ISO"
  default     = "/var/lib/vz/template/iso/ubuntu-22.04.3-desktop-amd64.iso"  
}
