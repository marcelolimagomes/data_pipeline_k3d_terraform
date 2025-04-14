resource "helm_release" "minio" {
  name             = "minio"
  repository       = "https://charts.min.io/"
  chart            = "minio"
  namespace        = "minio"
  create_namespace = true

  set {
    name  = "mode"
    value = "standalone"
  }
  set {
    name  = "rootUser"
    value = "admin"
  }
  set {
    name  = "rootPassword"
    value = "admin123"
  }
  set {
    name  = "persistence.enabled"
    value = "true"
  }
  set {
    name  = "consoleIngress.enabled"
    value = "true"
  }
  set {
    name  = "consoleIngress.hosts[0]"
    value = "minio.local"
  }
}
