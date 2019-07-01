From: Oliver Graute <oliver.graute@gmail.com>
Subject: [PATCHv2 1/2] arm64: add gpio4 and gpio5 to basic DTS for i.MX8MQ
Date: Mon,  1 Jul 2019 13:42:45 +0200
Message-ID: <20190701114253.1538-2-oliver.graute@kococonnector.com>
References: <20190701114253.1538-1-oliver.graute@kococonnector.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701114253.1538-1-oliver.graute@kococonnector.com>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com
Cc: sboyd@kernel.org, mturquette@baylibre.com, Oliver Graute <oliver.graute@kococonnector.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Li Yang <leoyang.li@nxp.com>, Sriram Dash <sriram.dash@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

add gpio4 to imx8qm.dtsi
add gpio5 to imx8qm.dtsi

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 526cbbddc202..fe4c584625cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -121,6 +121,25 @@
 		interrupt-parent = <&gic>;
 	};
 
+	gpio4: gpio@5d0c0000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x0 0x5d0c0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+};
+	gpio5: gpio@5d0d0000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x0 0x5d0d0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+		 gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1
