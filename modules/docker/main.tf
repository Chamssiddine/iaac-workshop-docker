terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

locals {
  containers = var.containers
}

resource "docker_image" "ssh_image" {
  name = var.image_name
  build {
    context    = "${path.module}/dockerfile"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "ssh_containers" {
  for_each = { for c in local.containers : c.name => c }

  name  = each.value.name
  image = docker_image.ssh_image.name

  ports {
    internal = 22
    external = each.value.host_ssh_port
  }

  env = each.value.environment_variables
}
