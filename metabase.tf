resource "helm_release" "metabase" {
  name             = "metabase"
  repository       = "https://helm.metabase.com"
  chart            = "metabase"
  namespace        = "metabase"
  create_namespace = true
}
