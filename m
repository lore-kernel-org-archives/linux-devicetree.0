From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/8] move native-mode inside display-timings
Date: Thu,  1 Aug 2019 17:46:20 +0200
Message-ID: <20190801154628.1624-1-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

For display descriptions in the device tree, native-mode is a property
of the display-timings node.

Fix this for the boards that got it wrong and added native-mode on the
same level as display-timings.

Martin Kaiser (8):
  ARM: dts: imx27 phyCARD-S: native-mode is part of display-timings
  ARM: dts: imx25: mbimxsd25: native-mode is part of display-timings
  ARM: dts: eukrea-mbimxsd27: native-mode is part of display-timings
  ARM: dts: mbimxsd25: native-mode is part of display-timings
  ARM: dts: imx27-phytec-phycore-rdk: native-mode is part of display-timings
  ARM: dts: edb7211: native-mode is part of display-timings
  ARM: dts: apf27dev: native-mode is part of display-timings
  ARM: dts: imx25: mbimxsd25: native-mode is part of display-timings

 arch/arm/boot/dts/ep7211-edb7211.dts                            | 2 +-
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts | 2 +-
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts | 2 +-
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts  | 2 +-
 arch/arm/boot/dts/imx27-apf27dev.dts                            | 2 +-
 arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts          | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts                | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts                  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.11.0
