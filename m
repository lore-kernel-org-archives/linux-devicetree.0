From: Andra Danciu <andradanciu1997@gmail.com>
Subject: [PATCH v3] arm64: dts: imx8mq: Add sai3 and sai6 nodes
Date: Tue,  2 Jul 2019 16:23:53 +0300
Message-ID: <20190702132353.18632-1-andradanciu1997@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, Anson.Huang@nxp.com, andrew.smirnov@gmail.com, angus@akkea.ca, ccaione@baylibre.com, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SAI3 and SAI6 nodes are used to connect to an external codec.
They have 1 Tx and 1 Rx dataline.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
---
Changes since v2:
	- removed multiple new lines

Changes since v1:
	- Added sai3 node because we need it to enable audio on pico-pi-8m
	- Added commit description

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808eff87..736cf81b695e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -278,6 +278,20 @@
 			#size-cells = <1>;
 			ranges = <0x30000000 0x30000000 0x400000>;
 
+			sai6: sai@30030000 {
+				compatible = "fsl,imx8mq-sai",
+					"fsl,imx6sx-sai";
+				reg = <0x30030000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
+					<&clk IMX8MQ_CLK_SAI6_ROOT>,
+					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
@@ -728,6 +742,21 @@
 				status = "disabled";
 			};
 
+			sai3: sai@308c0000 {
+				compatible = "fsl,imx8mq-sai",
+					     "fsl,imx6sx-sai";
+				reg = <0x308c0000 0x10000>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
+					<&clk IMX8MQ_CLK_DUMMY>,
+					<&clk IMX8MQ_CLK_SAI3_ROOT>,
+					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			i2c1: i2c@30a20000 {
 				compatible = "fsl,imx8mq-i2c", "fsl,imx21-i2c";
 				reg = <0x30a20000 0x10000>;
-- 
2.11.0
