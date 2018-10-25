From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH v1 0/4] ARM: dts: ccimx6ulsbcpro: Add 10" AUO/Goodix LVDS panel accessory kit
Date: Thu, 25 Oct 2018 17:09:29 +0200
Message-ID: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

Add support for a LVDS panel accessory kit consisting of:

* AU Optronics G101EVN010 10.1 inches TFT-LCD display
* Goodix GT911 capacitive touch controller

This is used with the ConnectCore 6UL SBC Pro (ccimx6ulsbcpro) board.

Changes in v1 from initial changeset [1]:

* Split configuration change into a different commit
* Provide meaningful commit messages
* Use the new DRM mxsfb driver for the AUO G101EVN010 panel

[1] https://lore.kernel.org/lkml/1540204399-12982-1-git-send-email-alex.gonzalez@digi.com/

Alex Gonzalez (4):
  drm/panel: simple: Add AUO G101EVN010 panel support
  ARM: dts: ccimx6ulsbcpro: Enable AUO G101EVN010 lcdif panel
  ARM: imx_v6_v7_defconfig: Select TOUCHSCREEN_GOODIX
  ARM: dts: ccimx6ulsbcpro: Add support for Goodix touch controller

 .../bindings/display/panel/auo,g101evn010          | 12 +++++++
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts        | 37 ++++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g101evn010
