terraform {
  required_providers {
    render = {
      source = "render-oss/render"
      version = "1.7.0"
    }
  }
}

provider "render" {
  # set RENDER_API_KEY and RENDER_OWNER_ID environment variables
}

resource "render_web_service" "graphite" {
  name = "graphite"
  plan = "starter"
  region = "ohio"
  runtime_source = {
    image = {
      image_url = "ghcr.io/cybardev/graphite"
      tag = "main"
    }
  }

  custom_domains = [
    { name : "gfx.cybar.dev" },
  ]
}
