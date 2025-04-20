module "ssh_containers" {
  source     = "./modules/docker"
  image_name = "custom-ssh-image:latest"

  containers = [
    {
      name           = "ssh_container_1"
      ports          = [
        { internal = 22, external = 2222 },
        { internal = 80, external = 8080 }
      ]
      environment_variables = ["ENV=dev"]
    },
    {
      name           = "ssh_container_2"
      ports          = [
        { internal = 22, external = 3333 },
        { internal = 80, external = 9090 }
      ]
    },
    {
      name           = "ssh_container_3"
      ports          = [
        { internal = 22, external = 4444 },
        { internal = 80, external = 9999 }
      ]
    }
  ]
}
