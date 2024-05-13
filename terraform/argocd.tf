resource "helm_release" "argocd-helm" {
  name = "argo-cd"
  namespace = kubernetes_namespace.argo-cd.metadata[0].name
  version = "6.8.1"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  create_namespace = true
  timeout = 1000

  values = [templatefile("argo-cd-values.yaml", {argocdpass = "${var.argocdpass}"})]
}