From: Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: [PATCHv3 0/3] Add initial support for slimport anx78xx
Date: Thu, 10 Sep 2015 18:35:49 +0200
Message-ID: <1441902952-14516-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

Hi all,

This is the third version with more changes requested by Dan.

The following series add initial support for the Slimport ANX7814 transmitter, a
ultra-low power Full-HD (1080p60) transmitter designed for portable device.

The driver was originally created and based from the work of Junhua Xia from
Analogix. This driver is a refactor of the original driver and fixes different
coding style lines, and different errors/warnings reported by checkpatch. Also
there were things that I noticed that we need to change like:

 - Convert the numbered GPIO API to the new descriptor based GPIO API.
 - Review the DT binding
 - Add missing MODULE_DEVICE_TABLE(of, ...);
 - Fix Makefiles and Kconfig to build conditionally.
 - Use SIMPLE_DEV_PM_OPS() instead of the deprecated i2c .suspend and
  .resume callbacks.
 - Move to use managed device resources.
 - Remove dead/unused code.
 - And others ...

Changes since v2 (requested by Daniel Kurtz)
 - clean up the typos, and little nits requested by Dan.
 - move to the drm/bridge directory
 - rename the files, variables, types, etc. to anx78xx
 - plumb through the context struct to all functions that act on the device
 - use proper messaging (dev_ rather than pr_, _dbg/_err rather than _info)

Changes since v1:
 - As requested by Greg, move from staging to a subsystem.

Best regards,

Enric Balletbo i Serra (3):
  of: Add vendor prefix for Analogix Semiconductor, Inc.
  devicetree: Add new ANX7814 SlimPort transmitter binding.
  drm: bridge: anx78xx: Add anx78xx driver support by analogix.

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/anx7814.txt   |   22 +
 drivers/gpu/drm/bridge/Kconfig                     |    2 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/anx78xx/Kconfig             |    7 +
 drivers/gpu/drm/bridge/anx78xx/Makefile            |    4 +
 drivers/gpu/drm/bridge/anx78xx/anx78xx.h           |   44 +
 drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c      |  241 ++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c   | 3198 ++++++++++++++++++++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h   |  215 ++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h   |  786 +++++
 11 files changed, 4521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/anx78xx.h
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h
 create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h

-- 
2.1.0
