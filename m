From: Archit Taneja <archit@ti.com>
Subject: [PATCH 0/4] arm: omap: DMM DT adaptation
Date: Fri, 13 Sep 2013 14:44:35 +0530
Message-ID: <1379063679-4869-1-git-send-email-archit@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org, robdclark@gmail.com, tomi.valkeinen@ti.com
Cc: devicetree@vger.kernel.org, Archit Taneja <archit@ti.com>
List-Id: devicetree@vger.kernel.org

The DMM/Tiler block can used by omapdrm to allocate frame buffers. With the
removal of address and irq data from the omap4 hwmods, the probe of DMM driver
fails and omapdrm isn't able to utilize the DMM hardware.

Add DMM bindings for omap4 and omap5. Also, make sure DRM device is built only
when omapdss device is built. Currently, it can register itself even without
the presence of omapdss device being built.

Archit Taneja (4):
  arm: omap: display: Create omapdrm inside omap_display_init
  ARM: dts: OMAP4+: Add DMM bindings
  drm: omap: Enable DT support for DMM
  arm: omap: display: Don't build device for DMM

 Documentation/devicetree/bindings/arm/omap/dmm.txt | 17 ++++++
 arch/arm/boot/dts/omap4.dtsi                       |  7 +++
 arch/arm/boot/dts/omap5.dtsi                       |  7 +++
 arch/arm/mach-omap2/Makefile                       |  4 --
 arch/arm/mach-omap2/display.c                      | 43 ++++++++++++++
 arch/arm/mach-omap2/drm.c                          | 67 ----------------------
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           | 11 ++++
 7 files changed, 85 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/omap/dmm.txt
 delete mode 100644 arch/arm/mach-omap2/drm.c

-- 
1.8.1.2

