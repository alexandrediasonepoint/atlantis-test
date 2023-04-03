data "external" "example" {
  program = ["sh", "-c", "strings ~/.atlantis/atlantis.db | tr ',' '\n' | grep CloneURL | sort | awk '{print $0\",\"}' | rev | cut -c2- | rev | xargs -0 printf '{ %s }'"]
}
output "test"  {
  value = data.external.example.result.CloneURL
}

