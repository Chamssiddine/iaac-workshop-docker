variable "image_name" {
  description = "Name of the Docker image"
  type        = string
  default     = "ssh-enabled-image:latest"
}

variable "containers" {
  description = "List of containers to create with SSH access"
  type = list(object({
    name                 = string
    host_ssh_port        = number
    environment_variables = optional(list(string), [])
  }))
}
