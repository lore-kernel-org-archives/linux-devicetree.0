From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4 v2] drm: Add support of ARC PGU display controller
Date: Thu,  3 Mar 2016 17:39:12 +0300
Message-ID: <1457015956-30708-1-git-send-email-abrodkin@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add support of ARC PGU display controller.
ARC PGU is a quite simple byte streamer that gets data from the framebuffer
and pushes it to hte connected encoder (DP or HDMI).

It was tested on ARC SDP boards (axs101 in particular).

Changes v1 -> v2:
 * Clean-up of DT bindings documentation
 * Added missing "pxlclk" clock in axs10x_mb.dtsi

Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Alexey Brodkin (4):
  drm: Add support of ARC PGU display controller
  drm: Add DT bindings documentation for ARC PGU display controller
  arc: axs10x - add support of ARC PGU
  MAINTAINERS: Add maintainer for ARC PGU display controller

 .../devicetree/bindings/display/snps,arcpgu.txt    |  33 +++
 MAINTAINERS                                        |   6 +
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  61 +++++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/arc/Kconfig                        |  10 +
 drivers/gpu/drm/arc/Makefile                       |   2 +
 drivers/gpu/drm/arc/arcpgu.h                       |  47 ++++
 drivers/gpu/drm/arc/arcpgu_crtc.c                  | 274 +++++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_drv.c                   | 239 ++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  | 204 +++++++++++++++
 drivers/gpu/drm/arc/arcpgu_regs.h                  |  36 +++
 12 files changed, 915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
 create mode 100644 drivers/gpu/drm/arc/Kconfig
 create mode 100644 drivers/gpu/drm/arc/Makefile
 create mode 100644 drivers/gpu/drm/arc/arcpgu.h
 create mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
