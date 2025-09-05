terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Redes
resource "docker_network" "app_net" {
  name = "app_net"
}

resource "docker_network" "persistence_net" {
  name = "persistence_net"
}

resource "docker_network" "monitor_net" {
  name = "monitor_net"
}

# Contenedores NGINX (3 instancias)
resource "docker_container" "nginx" {
  count = 3
  name  = "app${count.index + 1}"
  image = "nginx:stable-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }
}

# Redis
resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:7-alpine"

  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

# PostgreSQL
resource "docker_container" "postgres" {
  name  = "postgres"
  image = "postgres:15-alpine"

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

# Grafana
resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.image_id

  ports {
    internal = 3000
    external = 3030
  }

  networks_advanced {
    name = docker_network.app_net.name
  }

  networks_advanced {
    name = docker_network.monitor_net.name
  }
}
