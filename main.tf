terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {

  token     = var.token
  cloud_id  = "b1gmf70r4gqg487nkf9v"
  folder_id = "b1gvj4lgjq7227mhthmq"
  zone      = "ru-central1-b"
}

variable "token" {
  type        = string
  sensitive   = true
  }

resource "yandex_compute_instance" "vm-les-1" { 
  name = "vm-les-1"
  platform_id = "standard-v3"

  resources {
    cores  = 2 # vCPU
    memory = 2 # RAM
  }

  boot_disk {
    initialize_params {
      image_id = "fd8pqclrbi85ektgehlf" # ОС (Ubuntu, 20.04 LTS)
    }
  }

  network_interface {
    subnet_id = "e2lqqubbgvcve8cml39e" # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
