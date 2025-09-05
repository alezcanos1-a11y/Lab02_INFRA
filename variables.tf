variable "postgres_user" {
  description = "Usuario administrador de PostgreSQL"
  type        = string
}

variable "postgres_password" {
  description = "Contraseña del usuario administrador de PostgreSQL"
  type        = string
}

variable "postgres_db" {
  description = "Base de datos inicial de PostgreSQL"
  type        = string
}
