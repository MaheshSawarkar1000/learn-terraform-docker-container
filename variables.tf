variable "docker-image-name" {
  type = string
  default = "nginx"
}

variable "docker-container-name" {
  type = string
  default = "tutorial2"
}


variable "docker-internal-port" {
  type = string
  default = 80
}


variable "docker-external-port" {
  type = number
  default = 8011
}

variable "docker-container-count" {
  type = number
  default = 1
}