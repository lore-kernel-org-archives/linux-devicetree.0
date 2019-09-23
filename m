From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: [PATCH 0/5] Add support for iMX8MQ Display Controller Subsystem
Date: Mon, 23 Sep 2019 17:13:14 +0300
Message-ID: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: agx@sigxcpu.org, l.stach@pengutronix.de, Laurentiu Palcu <laurentiu.palcu@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds initial DCSS support for iMX8MQ chip. Initial support
includes only graphics plane support (no video planes), no HDR10 capabilities,
no graphics decompression (only linear, tiled and super-tiled buffers allowed).

Support for the rest of the features will be added incrementally, in subsequent
patches.

The patchset was tested with both HDP driver (not yet upstreamed) and MIPI-DSI
(drivers already on the dri-devel ML).

Thanks,
Laurentiu

Laurentiu Palcu (5):
  clk: imx8mq: Add VIDEO2_PLL clock
  drm/imx: compile imx directory by default
  drm/imx: Add initial support for DCSS on iMX8MQ
  dt-bindings: display: imx: add bindings for DCSS
  arm64: dts: imx8mq: add DCSS node

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  86 +++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  25 +
 drivers/clk/imx/clk-imx8mq.c                       |   4 +
 drivers/gpu/drm/Makefile                           |   2 +-
 drivers/gpu/drm/imx/Kconfig                        |   2 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dcss/Kconfig                   |   7 +
 drivers/gpu/drm/imx/dcss/Makefile                  |   6 +
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |  75 ++
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 223 ++++++
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c              | 447 +++++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c                | 286 +++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.h                | 195 +++++
 drivers/gpu/drm/imx/dcss/dcss-dpr.c                | 552 ++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c                | 182 +++++
 drivers/gpu/drm/imx/dcss/dcss-dtg.c                | 438 +++++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c                | 321 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h                |  52 ++
 drivers/gpu/drm/imx/dcss/dcss-plane.c              | 418 +++++++++++
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             | 830 +++++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-ss.c                 | 179 +++++
 include/dt-bindings/clock/imx8mq-clock.h           |   4 +-
 22 files changed, 4333 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c

-- 
2.7.4
