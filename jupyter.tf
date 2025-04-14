resource "helm_release" "jupyter" {
  name             = "jupyter"
  repository       = "https://jupyterhub.github.io/helm-chart/"
  chart            = "jupyterhub"
  namespace        = "jupyter"
  create_namespace = true

  set {
    name  = "singleuser.image.name"
    value = "jupyter/datascience-notebook"
  }
  set {
    name  = "singleuser.image.tag"
    value = "latest"
  }
}
