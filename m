From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/5 v4] drm: Add support of ARC PGU display controller
Date: Thu, 24 Mar 2016 19:48:31 +0300
Message-ID: <1458838116-24954-1-git-send-email-abrodkin@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add support of ARC PGU display controller.
ARC PGU is a quite simple byte streamer that gets data from the framebuffer
and pushes it to hte connected encoder (DP or HDMI).

It was tested on ARC SDP boards (axs101/103 in particular).

Note following series that introduces
drm_connector_register_all()/drm_connector_unregister_all() is a prerequisite
now: https://lkml.org/lkml/2016/3/23/61

Changes v3 -> v4:
 * Main driver author is now set properly (thanks Carlos for all your efforts)
 * Implemented correct hsync and vsync setup (thanks Jose)
 * Dummy call-backs were removed (as suggested by Daniel)
 * Obsolete load()/unload() call-backs were removed (as suggested by Daniel)
 * With above in mind we were able to adopt recently introduced
   drm_connector_register_all()/drm_connector_unregister_all()
 * Implemented setup of properties (uncached) for FB user-pages
 * Minor clean-up in DT binding docs and axs10x_mb.dtsi

Changes v2 -> v3:
 * Improved failure path if arcpgu_connector wasn't allocated.
 * Fixed driver building as module.
 * Implemented uncached mapping of user-space FB pages.
 * Again updated DT bindings docs.

Changes v1 -> v2:
 * Clean-up of DT bindings documentation.
 * Added missing "pxlclk" clock in axs10x_mb.dtsi.

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
Cc: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Carlos Palminha <palminha-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Alexey Brodkin (4):
  drm: Add DT bindings documentation for ARC PGU display controller
  MAINTAINERS: Add maintainer for ARC PGU display controller
  arc: Add our own implementation of fb_pgprotect()
  arc: axs10x - add support of ARC PGU

Carlos Palminha (1):
  drm: Add support of ARC PGU display controller

 .../devicetree/bindings/display/snps,arcpgu.txt    |  71 ++++++
 MAINTAINERS                                        |   6 +
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  61 +++++
 arch/arc/include/asm/fb.h                          |  19 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/arc/Kconfig                        |  10 +
 drivers/gpu/drm/arc/Makefile                       |   2 +
 drivers/gpu/drm/arc/arcpgu.h                       |  50 ++++
 drivers/gpu/drm/arc/arcpgu_crtc.c                  | 257 +++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_drv.c                   | 282 +++++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  | 201 +++++++++++++++
 drivers/gpu/drm/arc/arcpgu_regs.h                  |  40 +++
 13 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
 create mode 100644 arch/arc/include/asm/fb.h
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
