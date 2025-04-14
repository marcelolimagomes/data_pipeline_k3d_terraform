## Parâmetros: https://github.com/minio/minio/blob/master/helm/minio/values.yaml
resource "helm_release" "minio" {
  name             = "minio"
  repository       = "https://charts.min.io/"
  chart            = "minio"
  namespace        = "minio"
  create_namespace = true
  replace          = true # Para substituir a instalação existente, se necessário

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
    name  = "service.type"
    value = "NodePort"
  }
  set {
    name  = "service.nodePort"
    value = "30900" # Porta externa para a API MinIO (9000)
  }

  set {
    name  = "consoleService.type"
    value = "NodePort"
  }

  set {
    name  = "consoleService.nodePort"
    value = "30901" # Porta externa para a API MinIO (9000)
  }

}
