variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  default     = "https://192.168.127.134:8006/api2/json"
}

variable "pm_user" {
  description = "Nom d'utilisateur Proxmox"
  default     = "root"
}

variable "pm_password" {
  description = "Mot de passe Proxmox"
  default     = "rootroot"
}

variable "target_node" {
  description = "Nom du nœud Proxmox"
  default     = "pve"  // Remplacez "pve" par le nom de votre nœud Proxmox
}

variable "target_storage" {
  description = "Nom du stockage Proxmox"
  default     = "local"  // Remplacez "local" par le nom de votre stockage Proxmox
}

variable "bridge" {
  description = "Nom du réseau bridge"
  default     = "vmbr0"  // Remplacez "vmbr0" par le nom de votre pont réseau Proxmox
}

variable "disk_size" {
  description = "Taille du disque pour la machine virtuelle"
  default     = "10G"    // Remplacez "10G" par la taille souhaitée pour le disque de la VM
}

variable "os_type" {
  description = "Type du système d'exploitation"
  default     = "ubuntu" // Remplacez "ubuntu" par le type de système d'exploitation de votre choix
}

variable "clone_template" {
  type    = string
  default = "template"
}

21d17d80-eda1-40e6-a9fa-6966c9475c59
