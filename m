From: Oliver Graute <oliver.graute@gmail.com>
Subject: [PATCHv2 0/2] arm64: dts: add basic DTS for imx8qm-rom7720 board
Date: Mon,  1 Jul 2019 13:42:44 +0200
Message-ID: <20190701114253.1538-1-oliver.graute@kococonnector.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com
Cc: sboyd@kernel.org, mturquette@baylibre.com, Oliver Graute <oliver.graute@kococonnector.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Li Yang <leoyang.li@nxp.com>, Sriram Dash <sriram.dash@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Pankaj Bansal <pankaj.bansal@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, linux-k
List-Id: devicetree@vger.kernel.org

This patchset is ontop of Aisheng Dongs clock driver changes for the imx8qm

https://patchwork.kernel.org/cover/10824537/

This patchset is based on next-20190222

I need information about the status of the integration of the imx8qm clock
driver into mainline. Is this ongoing?

I need some hints why the imx8qm-rom7720 do NOT boot with the following
changes. It stops at "Starting kernel ..."

Oliver Graute (2):
  arm64: add gpio4 and gpio5 to basic DTS for i.MX8MQ
  arm64: dts: add basic DTS for imx8qm-rom7720-a1 board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-rom7720-a1.dts  | 221 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  19 ++
 3 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-rom7720-a1.dts

-- 
2.17.1
