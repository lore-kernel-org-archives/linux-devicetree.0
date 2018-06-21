From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Subject: [PATCH 0/3] ARM: dts: imx: add two ZII boards
Date: Thu, 21 Jun 2018 20:44:57 +0300
Message-ID: <1529603100-31958-1-git-send-email-andrey.gusakov@cogentembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, cphealy@gmail.com, andrew.smirnov@gmail.com, l.stach@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrey.gusakov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

Common part of dts was moved to imx51-zii-common.dtsi
for future reuse.

Andrey Gusakov (3):
  ARM: dts: imx51-zii-common: create common include dtsi
  ARM: dts: imx: add ZII SCU2 ESB board
  ARM: dts: imx: add ZII SCU2 Mezz board

 arch/arm/boot/dts/Makefile                |   4 +-
 arch/arm/boot/dts/imx51-zii-common.dtsi   | 317 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx51-zii-rdu1.dts      | 330 +++---------------------------
 arch/arm/boot/dts/imx51-zii-scu2-esb.dts  | 178 ++++++++++++++++
 arch/arm/boot/dts/imx51-zii-scu2-mezz.dts | 190 +++++++++++++++++
 5 files changed, 718 insertions(+), 301 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx51-zii-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx51-zii-scu2-esb.dts
 create mode 100644 arch/arm/boot/dts/imx51-zii-scu2-mezz.dts

-- 
1.9.1
