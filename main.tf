resource "null_resource" "file" {
  provisioner "file" {
    connection {
      type     = "ssh"
      user     = var.username
      password = var.password
      host     = var.host
    }
    content     = data.template_file.hello.rendered
    destination = "./hello"
  }


  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = var.username
      password = var.password
      host     = var.host
    }
    inline = ["touch toto"]
  }

  provisioner "remote-exec" {
    when = destroy
    connection {
      type     = "ssh"
      user     = var.username
      password = var.password
      host     = var.host
    }
    inline = ["rm toto", "rm hello"]
  }
}
