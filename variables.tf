variable "name" {
  type = string
  description = "The name of the person"
  default = "world"
}

variable "age" {
  type = number
  description = "The age of the person"
  default = 21
}

variable "host" {
  type = string
  description = "host"
}

variable "username" {
  type = string
  description = "username for ssh"
}

variable "password" {
  type = string
  description = "password for ssh"
}

