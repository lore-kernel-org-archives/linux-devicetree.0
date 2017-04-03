From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Mon,  3 Apr 2017 15:38:30 +0200
Message-ID: <cover.74614dd427b0214d0ba7ccfe75bdd7506b42e61d.1491226701.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Here is an attempt at supporting the ST7789V LCD controller from Sitronix.

It is controlled through an SPI bus, with a twist, since each byte sent
must be prefixed by a bit, which needs an 9-bits-per-word SPI controller,
which is quite rare. Else, you would need to bitbang it.

Let me know what you think,
Maxime

Changes from v2:
  - Added Rob's Acked-by

Changes from v1:
  - Added regulator support
  - Removed variadic arguments from the functions
  - Added test on the success of the SPI transfers
  - Used the MIPI DCS defines
  - Expanded the Kconfig help, and fixed the option label

Maxime Ripard (2):
  dt-bindings: display: panel: Add bindings for the Sitronix ST7789V panel
  drm/panel: Add driver for sitronix ST7789V LCD controller

 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt |  37 ++++++-
 drivers/gpu/drm/panel/Kconfig                                        |   7 +-
 drivers/gpu/drm/panel/Makefile                                       |   1 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c                       | 449 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 494 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
 create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c

base-commit: 62e499ad00e32736b2dd223f442e19d3df5eeed3
-- 
git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
