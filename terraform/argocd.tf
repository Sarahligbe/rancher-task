resource "helm_release" "argocd-helm" {
  name = "argo-cd"
  namespace = "argocd"
  version = "6.8.1"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  create_namespace = true
  timeout = 1000

  set {
    name = "configs.secret.argocdAdminPassword"
    value = var.argocdpass
  }

  set {
    name = "server.service.type"
    value = "NodePort"
  }
}

data "kubectl_filename_list" "manifests" {
    pattern = "../rancher/root.yaml"
}

resource "kubectl_manifest" "test" {
    count     = length(data.kubectl_filename_list.manifests.matches)
    yaml_body = file(element(data.kubectl_filename_list.manifests.matches, count.index))

    depends_on = [helm_release.argocd-helm]
}