From: daniel.baluta@nxp.com
Subject: [PATCH v4 1/2] arm64: dts: imx8mm: Add SAI nodes
Date: Tue,  4 Jun 2019 20:32:56 +0800
Message-ID: <20190604123257.2920-2-daniel.baluta@nxp.com>
References: <20190604123257.2920-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604123257.2920-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, m.felsch@pengutronix.de, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Daniel Baluta <daniel.baluta@nxp.com>

i.MX8MM has 5 SAI instances with the following base
addresses according to RM.

SAI1 base address: 3001_0000h
SAI2 base address: 3002_0000h
SAI3 base address: 3003_0000h
SAI5 base address: 3005_0000h
SAI6 base address: 3006_0000h

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 66 +++++++++++++++++++++++
 1 file changed, 66 insertions(+)

Shawn, although here https://lkml.org/lkml/2019/5/31/110 you 
say this patch is applied I couldn't find it in any of your
branches.

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 708d3c4c1389..321cd050e6f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -212,6 +212,72 @@
 			#size-cells = <1>;
 			ranges;
 
+			sai1: sai@30010000 {
+				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg = <0x30010000 0x10000>;
+				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SAI1_IPG>,
+					 <&clk IMX8MM_CLK_SAI1_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai2: sai@30020000 {
+				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg = <0x30020000 0x10000>;
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SAI2_IPG>,
+					<&clk IMX8MM_CLK_SAI2_ROOT>,
+					<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai3: sai@30030000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg = <0x30030000 0x10000>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SAI3_IPG>,
+					 <&clk IMX8MM_CLK_SAI3_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai5: sai@30050000 {
+				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg = <0x30050000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SAI5_IPG>,
+					 <&clk IMX8MM_CLK_SAI5_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai6: sai@30060000 {
+				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg = <0x30060000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SAI6_IPG>,
+					 <&clk IMX8MM_CLK_SAI6_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
-- 
2.17.1
