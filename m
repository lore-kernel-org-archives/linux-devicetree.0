From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 2/3] arm64: dts: imx8mm: Use correct clock for usdhc's ipg clk
Date: Tue,  8 Oct 2019 08:55:44 +0800
Message-ID: <1570496145-11053-2-git-send-email-Anson.Huang@nxp.com>
References: <1570496145-11053-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570496145-11053-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.lezcano@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On i.MX8MM, usdhc's ipg clock is from IMX8MM_CLK_IPG_ROOT,
assign it explicitly instead of using IMX8MM_CLK_DUMMY.

Fixes: a05ea40eb384 ("arm64: dts: imx: Add i.mx8mm dtsi support")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Add fixes tag.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 7c4dcce..8aafad2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -694,7 +694,7 @@
 				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MM_CLK_DUMMY>,
+				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
 					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
 					 <&clk IMX8MM_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
@@ -710,7 +710,7 @@
 				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MM_CLK_DUMMY>,
+				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
 					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
 					 <&clk IMX8MM_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
@@ -724,7 +724,7 @@
 				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
 				reg = <0x30b60000 0x10000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MM_CLK_DUMMY>,
+				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
 					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
 					 <&clk IMX8MM_CLK_USDHC3_ROOT>;
 				clock-names = "ipg", "ahb", "per";
-- 
2.7.4
