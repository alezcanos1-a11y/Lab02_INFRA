resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:7-alpine"

  ports {
    internal = 6379
    external = 16379
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
