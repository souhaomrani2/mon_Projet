variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  type        = string
}

variable "pm_user" {
  description = "Nom d'utilisateur pour se connecter à Proxmox"
  type        = string
}

variable "pm_password" {
  description = "Mot de passe pour se connecter à Proxmox"
  type        = string
}

variable "template" {
  description = "Nom du modèle de machine virtuelle"
  type        = string
  default     = "template_default_value"
}

variable "target_node" {
  description = "Nœud sur lequel la machine virtuelle sera créée"
  type        = string
}

variable "target_storage" {
  description = "Stockage sur lequel la machine virtuelle sera placée"
  type        = string
}

variable "bridge" {
  description = "Nom du pont réseau pour la connexion réseau de la machine virtuelle"
  type        = string
}

variable "disk_size" {
  description = "Taille du disque de la machine virtuelle"
  type        = string
}

variable "os_type" {
  description = "Type de système d'exploitation de la machine virtuelle"
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
  pm_user         = "root"
  pm_password     = "rootroot"
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
    type     = "scsi"
  }
  
  os_type = var.os_type
}

# Définition des valeurs des variables
variable "pm_api_url" {
  default = "https://192.168.127.134:8006/api2/json"
}

variable "pm_user" {
  default = "root"
}

variable "pm_password" {
  default = "rootroot"
}

variable "template" {
  default = "template"
}

variable "target_node" {
  default = "node"
}

variable "target_storage" {
  default = "node"
}

variable "bridge" {
  default = "your-bridge-name"
}

variable "disk_size" {
  default = "1G"
}

variable "os_type" {
  default = "l26"
}

