resource "kubernetes_namespace" "python-web-app" {
  metadata {
    name = var.python_web_app_namespace
  }
}

resource "kubernetes_secret" "docker-hub-reg" {
  metadata {
    name = "docker-hub-secret"
    namespace = var.python_web_app_namespace

  }
  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "email"    = var.registry_email
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}

# Load the yaml file, parsing the ${docker_image} variable
#
data "kubectl_path_documents" "manifests" {
    pattern = "./kubernetes/*.yaml"
}

resource "kubectl_manifest" "deploy-web-app" {
    for_each  = toset(data.kubectl_path_documents.manifests.documents)
    yaml_body = each.value
}