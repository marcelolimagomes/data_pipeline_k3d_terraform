resource "helm_release" "kafka" {
  name             = "kafka"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "kafka"
  version          = "31.5.0"
  namespace        = "kafka"
  create_namespace = true

  set {
    name  = "replicaCount"
    value = "1"
  }
  set {
    name  = "persistence.enabled"
    value = "true"
  }
}
