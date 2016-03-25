From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 0/5 v2] drm/vc4: DPI panel support
Date: Thu, 24 Mar 2016 17:23:46 -0700
Message-ID: <1458865431-30048-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is round 2 of the DPI panel support for vc4.  This time the
custom properties are dropped in favor of
connector->display_info.bus_formats[].

Testable tree is at:

https://github.com/anholt/linux/tree/drm-vc4-dpi-boot

Eric Anholt (5):
  of: Add vendor prefix for On Tat Industrial Company.
  panel-simple: Add the 7" DPI panel from Adafruit.
  drm: Add an encoder and connector type enum for DPI.
  drm/vc4: Add DPI driver
  ARM: bcm2835: Add the DPI hardware to the device tree.

 .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  36 ++
 .../bindings/display/panel/ontat,yx700wv03.txt     |   7 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/bcm283x.dtsi                     |  11 +
 drivers/gpu/drm/drm_crtc.c                         |   2 +
 drivers/gpu/drm/panel/panel-simple.c               |  35 ++
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/Makefile                       |   1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                      | 520 +++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |   5 +
 include/uapi/drm/drm_mode.h                        |   2 +
 13 files changed, 623 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
 create mode 100644 drivers/gpu/drm/vc4/vc4_dpi.c

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
