pid_file = "/tmp/vault-agent.pid"

vault {
  address = "http://host.docker.internal:8200"
}

auto_auth {
  method "token_file" {
    config = {
      token_file_path = "/vault/agent-token"
    }
  }
}

template {
  source      = "/vault/templates/database.env.ctmpl"
  destination = "/vault/runtime-secrets/database.env"
  perms       = "0600"
}
