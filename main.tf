resource "null_resource" "file" {
  triggers = {
    user = var.username
    password = var.password
    host = var.host
  }

  provisioner "file" {
    connection {
      type     = "ssh"
      user     = self.triggers.user
      password = self.triggers.password
      host     = self.triggers.host
    }
    content     = data.template_file.hello.rendered
    destination = "./hello"
  }


  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = self.triggers.user
      password = self.triggers.password
      host     = self.triggers.host
    }
    inline = ["touch toto"]
  }

  provisioner "remote-exec" {
    when = destroy
    connection {
      type     = "ssh"
      user     = self.triggers.user
      password = self.triggers.password
      host     = self.triggers.host
    }
    inline = ["rm toto", "rm hello"]
  }
}
