target "docker-metadata-action" {}

target "build" {
  inherits   = ["docker-metadata-action"]
  context    = "./"
  dockerfile = "Dockerfile"
  cache-from = ["type=registry,ref=ghcr.io/frezbo/builder-cache:gcp-workload-identity-federation-demo"]
  cache-to   = ["type=registry,ref=ghcr.io/frezbo/builder-cache:gcp-workload-identity-federation-demo,mode=max"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v6",
    "linux/arm/v7"
  ]
}
