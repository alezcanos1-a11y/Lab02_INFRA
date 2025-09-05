Proyecto Terraform: Infraestructura con Docker (Nginx, Grafana, PostgreSQL y Redis)

Este proyecto define y despliega una infraestructura ligera basada en Docker utilizando Terraform, con servicios clave para aplicaciones modernas:

Nginx (3 instancias balanceadas):
-Grafana (monitorización)
-PostgreSQL (base de datos relacional)
-Redis (cache y persistencia)

La infraestructura se conecta a través de redes Docker dedicadas para aplicaciones, persistencia y monitorización.

Estructura del proyecto
.
├── grafana.tf          # Contenedor Grafana
├── main.tf             # Configuración de Terraform y proveedor Docker
├── networks.tf         # Definición de redes
├── nginx.tf            # 3 contenedores Nginx
├── outputs.tf          # Outputs con accesos y credenciales
├── postgres.tf         # Contenedor PostgreSQL
├── redis.tf            # Contenedor Redis
├── terraform.tfvars    # Variables con valores por defecto
├── variables.tf        # Definición de variables

⚙️ Requisitos previos

Terraform
 >= 1.3

Docker
 en ejecución

Windows: habilitar npipe:////./pipe/docker_engine

Linux/macOS: usar unix:///var/run/docker.sock

Instalación y uso

Clonar el repositorio

git clone https://github.com/tu-usuario/tu-repo.git
cd tu-repo


Inicializar Terraform

terraform init


Planificar la infraestructura

terraform plan


Aplicar la configuración

terraform apply -auto-approve

Servicios desplegados
Servicio	Puerto Local	URL de acceso
Nginx 1	8081	http://localhost:8081

Nginx 2	8082	http://localhost:8082

Nginx 3	8083	http://localhost:8083

Grafana	3030	http://localhost:3030

Postgres	15432	localhost:15432
Redis	16379	localhost:16379
Variables

Las variables principales están definidas en variables.tf y parametrizadas en terraform.tfvars.

Variable	Descripción	Valor por defecto
postgres_user	Usuario administrador de PostgreSQL	admin
postgres_password	Contraseña del usuario	admin123
postgres_db	Base de datos inicial	appdb

Puedes modificar los valores en terraform.tfvars.

Outputs
Después de aplicar la infraestructura, Terraform mostrará:
nginx_urls → URLs de los contenedores Nginx
grafana_url → URL de Grafana
postgres_credentials → Credenciales de PostgreSQL (sensibles)

Limpieza
Para eliminar toda la infraestructura:
terraform destroy -auto-approve

Convenciones de commits
Este proyecto sigue la especificación de Conventional Commits:

feat: Nueva funcionalidad

fix: Corrección de errores

docs: Cambios en la documentación

style: Formato, estilos, sin cambios de lógica

refactor: Refactorización de código

test: Añadir o modificar pruebas
