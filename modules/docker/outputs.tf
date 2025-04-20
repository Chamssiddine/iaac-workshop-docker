output "container_ids" {
  value = { for k, v in docker_container.ssh_containers : k => v.id }
}
