From: Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: [PATCHv4 0/3] Add initial support for slimport anx78xx
Date: Fri, 25 Sep 2015 21:29:25 +0200
Message-ID: <1443209368-7135-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Hi all,

This is the fouth version with fixes suggested by Nicolas Boichat and Dan Carpenter.

See the changelog below for details.

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

Changes since v3:

Nicolas Boichat: 
 - Integrate sp_edid_header_result with sp_check_edid_data
 - Fix loop forever.
 - Use meaningful messages and variable names
 - Replace some 'while' loops and use a for loop.
 - Might be clearer to say >= LINK_6P75G
 - Convert a function to void function because always return 0
 - Remove some magic numbers and refactor sp_tx_pclk_calc
 - Replace sp_read_reg(SP_TX_LINK_BW_SET_REG) for sp_tx_get_link_bw.
 - Mask bits 4:0. Bit 5 has another purpose, and 7:6 are reserved.
 - Use ARRAY_SIZE.
 - Use memset for initialization.
 - Simply condition if (!(c1 & POLLING_EN) || (c & POLLING_ERR))
 - Don not use a temporal variable write the value directly.
 - Fix various typos
 - Return directly PTR_ERR.

Dan Carpenter: 
 - Refactor while loop removing the earlier condition and do while (--c) instead
 - Simplify double negative and fix alignment
 - Remove the superflous casts to u16 and parens
 - Remove debug printks and use ftrace instead.
 - Flip this condition around and pull the code in one indent level.
 - Fix return value 'ret' that should be an int. It causes a signedness bug later.
 - Use better style for devm_kzalloc
 - Get rid of AUX_*.  They aren't used much and we could easily use normal error codes instead.

Enric Balletbo
 - Fix errors reported by scripts/checkpatch.pl --strict --subjective
 - Remove XTAL_CLK_M10 XTAL_CLK definitions
 - replace ulong for unsigned long
 - remove some magic numbers and refactor sp_tx_enable_audio_output
 - remove some magic numbers and refactor sp_tx_phy_auto_test

Changes since v2 (requested by Daniel Kurtz):
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
 drivers/gpu/drm/bridge/anx78xx/anx78xx.h           |   41 +
 drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c      |  228 ++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c   | 3148 ++++++++++++++++++++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h   |  214 ++
 drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h   |  807 +++++
 11 files changed, 4475 insertions(+)
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
