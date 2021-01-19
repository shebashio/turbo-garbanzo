# -----------------------------------------------------------------------------
# List secrets in the demo-kv KV secrets engine
# -----------------------------------------------------------------------------
path "demo-kv/" {
  capabilities = ["list"]
}

# -----------------------------------------------------------------------------
# Create and update secrets in the demo-kv KV secrets engine
# -----------------------------------------------------------------------------
path "kv/+" {
  capabilities = ["create", "update"]

  control_group = {
    factor "authorizer" {
      identity {
        group_names = [ "sudoers" ]
        approvals   = 1
      }
    }
  }
}
