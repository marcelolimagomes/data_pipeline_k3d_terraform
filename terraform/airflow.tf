resource "helm_release" "airflow" {
  name             = "airflow"
  repository       = "https://airflow.apache.org"
  chart            = "airflow"
  namespace        = "airflow"
  create_namespace = true

  set {
    name  = "executor"
    value = "KubernetesExecutor"
  }
  set {
    name  = "webserver.defaultUser.enabled"
    value = "true"
  }
  set {
    name  = "webserver.defaultUser.username"
    value = "admin"
  }
  set {
    name  = "webserver.defaultUser.password"
    value = "admin"
  }

  # Configurações CRÍTICAS para funcionamento com Terraform (conforme documentação)
  set {
    name  = "createUserJob.useHelmHooks"
    value = "false"
  }
  set {
    name  = "createUserJob.applyCustomEnv"
    value = "false"
  }
  set {
    name  = "migrateDatabaseJob.useHelmHooks"
    value = "false"
  }
  set {
    name  = "migrateDatabaseJob.applyCustomEnv"
    value = "false"
  }
}
