terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.16"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.15"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 4.79"
    }
  }
}
