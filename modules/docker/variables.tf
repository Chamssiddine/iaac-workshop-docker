variable "image_name" {
  description = "Name of the Docker image"
  type        = string
  default     = "ssh-enabled-image:latest"
}

variable "containers" {
  description = "List of containers to create with SSH access"
  type = list(object({
    name                 = string
    environment_variables = optional(list(string), [])
    ports                = list(object({
      internal = number
      external = number
    }))
  }))
}
