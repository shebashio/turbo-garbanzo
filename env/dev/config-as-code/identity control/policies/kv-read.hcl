# -----------------------------------------------------------------------------
# List secrets in the demo-kv KV secrets engine
# -----------------------------------------------------------------------------
path "demo-kv/" {
  capabilities = ["list"]
}

# -----------------------------------------------------------------------------
# Read secrets in the demo-kv KV secrets engine
# -----------------------------------------------------------------------------
path "demo-kv/+" {
  capabilities = ["read"]

  control_group = {
    factor "authorizer" {
      identity {
        group_names = [ "sudoers" ]
        approvals   = 2
      }
    }
  }
}
