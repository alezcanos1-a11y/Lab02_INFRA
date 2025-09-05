output "grafana_url" {
  description = "URL de acceso a Grafana"
  value       = "http://localhost:3000"
}

output "postgres_credentials" {
  description = "Credenciales de PostgreSQL"
  value       = {
    user     = var.postgres_user
    password = var.postgres_password
    database = var.postgres_db
  }
  sensitive = true
}
