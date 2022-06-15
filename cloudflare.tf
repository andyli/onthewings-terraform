resource "cloudflare_record" "onthewings-root" {
  name    = "onthewings.net"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "34.198.182.201"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-sacredibis" {
  name    = "sacredibis"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "14.198.82.52"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-www" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "34.198.182.201"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-augmented-mirror" {
  name    = "augmented-mirror"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "andyli.github.io"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-blog" {
  name    = "blog"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-calendar" {
  name    = "calendar"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-docs" {
  name    = "docs"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-mail" {
  name    = "mail"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-sites" {
  name    = "sites"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-mx20" {
  name     = "onthewings.net"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mailsec.protonmail.ch"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-mx10" {
  name     = "onthewings.net"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mail.protonmail.ch"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_5ad357e301942f8a66ed6a6f6d21f336" {
  name     = "_sipfederationtls._tcp"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "SRV"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
  data {
    name     = "onthewings.net"
    port     = 5061
    priority = 10
    proto    = "_tcp"
    service  = "_sipfederationtls"
    target   = "federation.messenger.msn.com"
    weight   = 2
  }
}

resource "cloudflare_record" "onthewings-acme-sacredibis" {
  name    = "_acme-challenge.sacredibis"
  proxied = false
  ttl     = 120
  type    = "TXT"
  value   = "-GekceQRo8Dw1ZmnjobMV67VpYBB99mot84qvGA0JSU"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-gitlab-pages-verification" {
  for_each = toset(["*", "onthewings.net"])

  name    = each.key
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "gitlab-pages-verification-code=b31f20901aeabd4923a9b3cd2040ef12"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-keybase-site-verification" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "keybase-site-verification=uDftgK__Cntj4bAL2GkpM2iIWVgVqPTZ7GGIpTktiL0"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-brave-ledger-verification" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "brave-ledger-verification=6326244af3ff750b8295de6d215e555d2bd45ff719c74df2b8d473f008c81f61"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail-verification" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=d380f0b1ce6a79e5513696144d64fcd0e12a602b"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail-spf" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch mx ~all"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail_domainkey" {
  name    = "protonmail._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail.domainkey.duyo6ecizhazx3bzmvbxbdokyfvqqui7gv6w2bfu3qkadfkpt37ka.domains.proton.ch"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail2_domainkey" {
  name    = "protonmail2._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail2.domainkey.duyo6ecizhazx3bzmvbxbdokyfvqqui7gv6w2bfu3qkadfkpt37ka.domains.proton.ch"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail3_domainkey" {
  name    = "protonmail3._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail3.domainkey.duyo6ecizhazx3bzmvbxbdokyfvqqui7gv6w2bfu3qkadfkpt37ka.domains.proton.ch"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "onthewings-protonmail-dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=none"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}
