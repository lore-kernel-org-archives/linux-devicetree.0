From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 00/10] Improvements and fixes for mxsfb DRM driver
Date: Wed, 26 Jun 2019 16:32:08 +0300
Message-ID: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch-set improves the use of eLCDIF block on iMX 8 SoCs (like 8MQ, 8MM
and 8QXP). Following, are the new features added and fixes from this
patch-set:

1. Add support for drm_bridge
On 8MQ and 8MM, the LCDIF block is not directly connected to a parallel
display connector, where an LCD panel can be attached, but instead it is
connected to DSI controller. Since this DSI stands between the display
controller (eLCDIF) and the physical connector, the DSI can be implemented
as a DRM bridge. So, in order to be able to connect the mxsfb driver to
the DSI driver, the support for a drm_bridge was needed in mxsfb DRM
driver (the actual driver for the eLCDIF block).

2. Add support for additional pixel formats
Some of the pixel formats needed by Android were not implemented in this
driver, but they were actually supported. So, add support for them.

3. Add support for horizontal stride
Having support for horizontal stride allows the use of eLCDIF with a GPU
(for example) that can only output resolution sizes multiple of a power of
8. For example, 1080 is not a power of 16, so in order to support 1920x1080
output from GPUs that can produce linear buffers only in sizes multiple to 16,
this feature is needed.

3. Few minor features and bug-fixing
The addition of max-res DT property was actually needed in order to limit
the bandwidth usage of the eLCDIF block. This is need on systems where
multiple display controllers are presend and the memory bandwidth is not
enough to handle all of them at maximum capacity (like it is the case on
8MQ, where there are two display controllers: DCSS and eLCDIF).
The rest of the patches are bug-fixes.

Mirela Rabulea (1):
  drm/mxsfb: Signal mode changed when bpp changed

Robert Chiras (9):
  drm/mxsfb: Update mxsfb to support a bridge
  drm/mxsfb: Update mxsfb with additional pixel formats
  drm/mxsfb: Fix the vblank events
  dt-bindings: display: Add max-res property for mxsfb
  drm/mxsfb: Add max-res property for MXSFB
  drm/mxsfb: Update mxsfb to support LCD reset
  drm/mxsfb: Improve the axi clock usage
  drm/mxsfb: Clear OUTSTANDING_REQS bits
  drm/mxsfb: Add support for horizontal stride

 .../devicetree/bindings/display/mxsfb.txt          |   6 +
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 | 290 ++++++++++++++++++---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  | 189 +++++++++++---
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |  10 +-
 drivers/gpu/drm/mxsfb/mxsfb_out.c                  |  26 +-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 | 128 ++++++---
 6 files changed, 531 insertions(+), 118 deletions(-)

-- 
2.7.4
