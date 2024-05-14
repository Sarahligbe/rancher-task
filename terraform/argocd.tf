resource "helm_release" "argocd-helm" {
  name = "argo-cd"
  namespace = kubernetes_namespace.argo-cd.metadata[0].name
  version = "6.8.1"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  create_namespace = true
  timeout = 1000

  set {
    name = "configs.secret.argocdAdminPassword"
    value = var.argocdpass
  }
}

#apply the rancher argocd main config file
resource "kubectl_manifest" "application" {
  yaml_body = file(../rancher/root.yaml)
}