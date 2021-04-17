variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "docker_image" {
  type = string
}

variable "env_variables" {
  type    = map(string)
  default = {}
}