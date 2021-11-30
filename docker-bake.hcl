target "docker-metadata-action" {}

target "build" {
  inherits   = ["docker-metadata-action"]
  context    = "./"
  dockerfile = "Dockerfile"
  cache-from = ["type=registry,ref=ghcr.io/frezbo/gcp-workload-identity-federation-demo:builder-cache"]
  cache-to   = ["type=registry,ref=ghcr.io/frezbo/gcp-workload-identity-federation-demo:builder-cache,mode=max"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v6",
    "linux/arm/v7"
  ]
}
