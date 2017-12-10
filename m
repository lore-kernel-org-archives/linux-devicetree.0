From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 0/2] DRM driver for Sitronix ST7735R display panels
Date: Sun, 10 Dec 2017 16:10:31 -0600
Message-ID: <1512943833-31352-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds a new DRM/TinyDRM driver for Sitronix ST7735R, specifically
the Adafruit 1.8" TFT.

Nothing fancy here. Just mostly TinyDRM boilerplate with the init sequence
from the fbtft driver for the same panel.

Please see new discussion on device tree bindings in patch 1/2.

David Lechner (2):
  dt-bindings: Add binding for Sitronix ST7735R display panels
  drm/tinydrm: add driver for ST7735R panels

 .../bindings/display/sitronix,st7735r.txt          |  35 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
 drivers/gpu/drm/tinydrm/Makefile                   |   1 +
 drivers/gpu/drm/tinydrm/st7735r.c                  | 219 +++++++++++++++++++++
 5 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
 create mode 100644 drivers/gpu/drm/tinydrm/st7735r.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
