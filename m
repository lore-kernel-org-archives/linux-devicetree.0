From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Add ZTE VGA driver support
Date: Thu,  6 Apr 2017 23:01:06 +0800
Message-ID: <1491490870-6330-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The series adds the driver for ZTE VGA device, which becomes the third
VOU output device we support, besides the existing HDMI and TV Encoder.

Changes for v2:
 - Add return check for encoder and connector init function calls.
 - Improve comments in function zx_vga_irq_handler() to avoid confusion.
 - Add lock for VGA_AUTO_DETECT_SEL register access to avoid race
   condition between irq handler and .get_modes hook.
 - Copy device tree maintainer and list for bindings doc.

Shawn Guo (4):
  drm: zte: do not enable clock auto-gating by default
  drm: zte: move CSC register definitions into a common header
  dt-bindings: display: add support for ZTE VGA device
  drm: zte: add VGA driver support

 .../devicetree/bindings/display/zte,vou.txt        |  21 +
 drivers/gpu/drm/zte/Makefile                       |   1 +
 drivers/gpu/drm/zte/zx_common_regs.h               |  31 ++
 drivers/gpu/drm/zte/zx_drm_drv.c                   |   1 +
 drivers/gpu/drm/zte/zx_drm_drv.h                   |   1 +
 drivers/gpu/drm/zte/zx_plane.c                     |   1 +
 drivers/gpu/drm/zte/zx_plane_regs.h                |  18 -
 drivers/gpu/drm/zte/zx_vga.c                       | 530 +++++++++++++++++++++
 drivers/gpu/drm/zte/zx_vga_regs.h                  |  36 ++
 drivers/gpu/drm/zte/zx_vou.c                       |  36 +-
 drivers/gpu/drm/zte/zx_vou_regs.h                  |  12 +-
 11 files changed, 663 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
 create mode 100644 drivers/gpu/drm/zte/zx_vga.c
 create mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
