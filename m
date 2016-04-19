From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 0/4 v6] drm: Add support of ARC PGU display controller
Date: Tue, 19 Apr 2016 16:19:36 +0300
Message-ID: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-snps-arc@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
List-Id: devicetree@vger.kernel.org

This series add support of ARC PGU display controller.
ARC PGU is a quite simple byte streamer that gets data from the framebuffer
and pushes it to hte connected encoder (DP or HDMI).

It was tested on ARC SDP boards (axs101/103 in particular).

Note following series (v6) that introduces drm_connector_register_all()
is a prerequisite now: https://lkml.org/lkml/2016/4/19/299

Changes v5 -> v6:
 * "arc: Add our own implementation of fb_pgprotect()" was already applied to
   ARC's tree and available in linux-next:
   http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=e5e0a65cd20a7a892a87e6bd73bdc3d83726d725

Changes v4 -> v5:
 * Removed encode node from DT bindings example (as suggested by Rob)

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

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: Carlos Palminha <palminha@synopsys.com>

Alexey Brodkin (3):
  drm: Add DT bindings documentation for ARC PGU display controller
  MAINTAINERS: Add maintainer for ARC PGU display controller
  arc: axs10x - add support of ARC PGU

Carlos Palminha (1):
  drm: Add support of ARC PGU display controller

 .../devicetree/bindings/display/snps,arcpgu.txt    |  35 +++
 MAINTAINERS                                        |   6 +
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  61 +++++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/arc/Kconfig                        |  10 +
 drivers/gpu/drm/arc/Makefile                       |   2 +
 drivers/gpu/drm/arc/arcpgu.h                       |  50 ++++
 drivers/gpu/drm/arc/arcpgu_crtc.c                  | 257 +++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_drv.c                   | 282 +++++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  | 201 +++++++++++++++
 drivers/gpu/drm/arc/arcpgu_regs.h                  |  40 +++
 12 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
 create mode 100644 drivers/gpu/drm/arc/Kconfig
 create mode 100644 drivers/gpu/drm/arc/Makefile
 create mode 100644 drivers/gpu/drm/arc/arcpgu.h
 create mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h

-- 
2.5.5
