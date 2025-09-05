resource "docker_container" "postgres" {
  name  = "postgres"
  image = "postgres:15-alpine"

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = 15432
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
