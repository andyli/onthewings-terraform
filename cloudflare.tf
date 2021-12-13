resource "cloudflare_record" "terraform_managed_resource_c11e63b1da52ec82a4b7002405837aaa" {
  name    = "onthewings.net"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "34.198.182.201"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_ab7971e4c9e20ad3d08d81be138cf450" {
  name    = "sacredibis"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "14.198.82.52"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_79684b13a42672afdab47bac8570cff1" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "34.198.182.201"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_65218cb22dfca6caf7fc1d529b01d6eb" {
  name    = "augmented-mirror"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "andyli.github.io"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_8dda66d56bb378b7729f6c6162c0b82c" {
  name    = "blog"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_674f35bad895154f5833a8a78056e699" {
  name    = "calendar"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_e47500b678ff4cfa6f89ddb275d63da8" {
  name    = "docs"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_f8636cc36035a70e28c0737306093102" {
  name    = "mail"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_03afa381f43307d156f6f4801a620b55" {
  name    = "sites"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.google.com"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_f6cdecad9b268d6d7e36f8c7ddf21dc2" {
  name     = "onthewings.net"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "aspmx2.googlemail.com"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_6a34db232d1db9619f366fdf79472b65" {
  name     = "onthewings.net"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "aspmx.l.google.com"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_2374727bfb97fc0b1796de3d7279c566" {
  name     = "onthewings.net"
  priority = 15
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_e2183782543b4ae3118e75a487f331d0" {
  name     = "onthewings.net"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  zone_id  = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_15ee4973db0f204204f34260b2d39189" {
  name     = "onthewings.net"
  priority = 25
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "aspmx3.googlemail.com"
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

resource "cloudflare_record" "terraform_managed_resource_b482c4440e86d9574c04d694f294ba1b" {
  name    = "_acme-challenge.sacredibis"
  proxied = false
  ttl     = 120
  type    = "TXT"
  value   = "-GekceQRo8Dw1ZmnjobMV67VpYBB99mot84qvGA0JSU"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_8e0a4a87651a052ebb05a649ba49242d" {
  name    = "*"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "gitlab-pages-verification-code=b31f20901aeabd4923a9b3cd2040ef12"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_4284c811db771369ae5a4068ab3f06c5" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "keybase-site-verification=uDftgK__Cntj4bAL2GkpM2iIWVgVqPTZ7GGIpTktiL0"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_c08ecf9d06d698a428ec8198a0d5cdb5" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "brave-ledger-verification=6326244af3ff750b8295de6d215e555d2bd45ff719c74df2b8d473f008c81f61"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

resource "cloudflare_record" "terraform_managed_resource_1671f72f9ea1c7d29f3b2af60052b67c" {
  name    = "onthewings.net"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "gitlab-pages-verification-code=b31f20901aeabd4923a9b3cd2040ef12"
  zone_id = "fe07cc86b0ddbb11b6a0fb9476aba111"
}

