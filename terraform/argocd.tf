resource "helm_release" "argocd-helm" {
  name = "argo-cd"
  namespace = "argocd"
  version = "6.8.1"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  create_namespace = true
  timeout = 1000

  set {
    name = "server.service.type"
    value = "NodePort"
  }
}

resource "kubectl_manifest" "test" {
  yaml_body = "${file("../rancher/root.yaml")}"

  depends_on = [helm_release.argocd-helm]
}