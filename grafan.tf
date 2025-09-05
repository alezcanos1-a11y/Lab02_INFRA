resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:latest"

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
