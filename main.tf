resource "docker_image" "image" {
  name         = var.docker-image-name
  keep_locally = false
}

resource "docker_container" "container" {
  count = var.docker-container-count  # Create 20 containers
  name  = "${var.docker-container-name}-${count.index + 1}"
  image = docker_image.image.image_id

#  hostname = harshal
  env = [
    "ENV=dev"
    ]


  ports {
    internal = var.docker-internal-port
    external = var.docker-external-port + count.index 
  }
}



# # Create 20 Docker containers dynamically using the `count` parameter
# resource "docker_container" "my_container" {
#   count = 20  # Create 20 containers

#   name  = "nginx-container-${count.index + 1}"  # Container name will be dynamically generated
#   image = docker_image.my_image.name

#   # Set environment variables for each container
#   env = [
#     "APP_NAME=my-app",
#     # "APP_ENV=production",
#     # "DB_HOST=db.example.com",
#     # "DB_PORT=5432"
#   ]
  
#   ports {
#     internal = 80
#     external = 8080 + count.index  # Dynamically assign external ports starting from 8080
#   }

#   restart = "unless-stopped"
# }