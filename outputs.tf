output "nginx_urls" {
  description = "URLs de acceso a las apps Nginx"
  value = [
    "http://localhost:8081",
    "http://localhost:8082",
    "http://localhost:8083"
  ]
}

output "grafana_url" {
  description = "URL de acceso a Grafana"
  value       = "http://localhost:3030"
}

output "postgres_credentials" {
  description = "Credenciales de PostgreSQL"
  value = {
    user     = var.postgres_user
    password = var.postgres_password
    database = var.postgres_db
    host     = "localhost"
    port     = 15432
  }
  sensitive = true
}
