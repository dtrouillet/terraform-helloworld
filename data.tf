data "template_file" "hello" {
  template = file("${path.module}/file_templates/hello.tpl")
  vars = {
    name = var.name
    age = var.age
  }
}
