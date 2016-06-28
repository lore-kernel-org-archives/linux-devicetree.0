From: andrej@inversepath.com
Subject: [PATCH v2 0/2] imx53: add support for USB armory board
Date: Tue, 28 Jun 2016 14:54:42 +0200
Message-ID: <20160628125444.16531-1-andrej@inversepath.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Vagrant Cascadian <vagrant@debian.org>, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Andrej Rosano <andrej@inversepath.com>

This patchset add the support for USB armory board:
https://inversepath.com/usbarmory

v2: Changes proposed by Shawn Guo <shawnguo@kernel.org>
- re-licensing dts to dual GPL/X11 license
- various fixes in dts file

Andrej Rosano (2):
  devicetree: Add vendor prefix for Inverse Path
  ARM: dts: imx53: add support for USB armory board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx53-usbarmory.dts              | 223 +++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dts

-- 
2.9.0
