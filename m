From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Fri,  3 Feb 2017 10:59:04 +0100
Message-ID: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Here is an attempt at supporting the ST7789V LCD controller from Sitronix.

It is controlled through an SPI bus, with a twist, since each byte sent
must be prefixed by a bit, which needs an 9-bits-per-word SPI controller,
which is quite rare. Else, you would need to bitbang it.

Let me know what you think,
Maxime

Maxime Ripard (2):
  dt-bindings: display: panel: Add bindings for the Sitronix ST7789V panel
  drm/panel: Add driver for sitronix ST7789V panel

 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt |  36 ++++++-
 drivers/gpu/drm/panel/Kconfig                                        |   4 +-
 drivers/gpu/drm/panel/Makefile                                       |   1 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c                       | 435 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 476 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
 create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c

base-commit: 2a6e628efb37432a83bb42b00e3c403b1d8873dd
-- 
git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
