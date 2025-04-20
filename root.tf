module "ssh_containers" {
  source     = "./modules/docker"
  image_name = "custom-ssh-image:latest"

  containers = [
    {
      name           = "ssh_container_1"
      host_ssh_port  = 2222
      environment_variables = ["ENV=dev"]
    },
    {
      name           = "ssh_container_2"
      host_ssh_port  = 2223
    }
  ]
}
