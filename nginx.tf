resource "docker_container" "nginx" {
  count = 3
  name  = "app${count.index + 1}"
  image = "nginx:stable-alpine"

  ports {
    internal = 80
    external = 8081 + count.index
  }

  networks_advanced {
    name = docker_network.app_net.name
  }
}
