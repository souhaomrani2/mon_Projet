
variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  default     = "https://192.168.127.177:8006/api2/json"
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

variable "template" {
  description = "Modèle pour la création de la machine virtuelle"
  type        = string
  default     = "tmp"
}
