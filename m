From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 0/3] Add support for the Purism Librem5 devkit
Date: Mon, 11 Mar 2019 16:46:52 -0700
Message-ID: <20190311234655.30357-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>, abel.vesa@nxp.com, daniel.baluta@nxp.com, agx@sigxcpu.org, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

The Librem5 devkit is based on the imx8mq from NXP. This is a default config
and devicetree to boot the board to a command prompt.

Angus Ainslie (Purism) (3):
  arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
  arm64: dts: fsl: Build the Librem5 devkit devicetree
  arm64: librem5-devkit: Add defconfig for the Librem5 devkit

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 804 ++++++++++++++++++
 arch/arm64/configs/librem5-devkit_defconfig   | 534 ++++++++++++
 3 files changed, 1339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
 create mode 100644 arch/arm64/configs/librem5-devkit_defconfig

-- 
2.17.1
