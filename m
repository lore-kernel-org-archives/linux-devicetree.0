From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] Add initial ZTE VOU DRM/KMS driver
Date: Sat, 24 Sep 2016 22:26:23 +0800
Message-ID: <1474727185-24180-1-git-send-email-shawn.guo@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The series adds the initial ZTE VOU display controller DRM/KMS driver.
There are still some features to be added, like overlay plane, scaling,
and more output devices support.  But it's already useful with dual
CRTCs and HDMI monitor working.

Changes for v2:
 - Change device tree bindings to kill the virtual display-subsystem
   node make VOU the parent node.

Shawn Guo (2):
  dt-bindings: add bindings doc for ZTE VOU display controller
  drm: zte: add initial vou drm driver

 .../devicetree/bindings/display/zte,vou.txt        |  86 +++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/zte/Kconfig                        |   8 +
 drivers/gpu/drm/zte/Makefile                       |   8 +
 drivers/gpu/drm/zte/zx_crtc.c                      | 691 +++++++++++++++++++++
 drivers/gpu/drm/zte/zx_crtc.h                      |  47 ++
 drivers/gpu/drm/zte/zx_drm_drv.c                   | 258 ++++++++
 drivers/gpu/drm/zte/zx_drm_drv.h                   |  22 +
 drivers/gpu/drm/zte/zx_hdmi.c                      | 540 ++++++++++++++++
 drivers/gpu/drm/zte/zx_plane.c                     | 362 +++++++++++
 drivers/gpu/drm/zte/zx_plane.h                     |  26 +
 12 files changed, 2051 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt
 create mode 100644 drivers/gpu/drm/zte/Kconfig
 create mode 100644 drivers/gpu/drm/zte/Makefile
 create mode 100644 drivers/gpu/drm/zte/zx_crtc.c
 create mode 100644 drivers/gpu/drm/zte/zx_crtc.h
 create mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
 create mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
 create mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
 create mode 100644 drivers/gpu/drm/zte/zx_plane.c
 create mode 100644 drivers/gpu/drm/zte/zx_plane.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
