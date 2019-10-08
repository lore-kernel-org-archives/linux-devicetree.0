From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 1/3] arm64: dts: imx8mq: Use correct clock for usdhc's ipg clk
Date: Tue,  8 Oct 2019 08:55:43 +0800
Message-ID: <1570496145-11053-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.lezcano@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On i.MX8MQ, usdhc's ipg clock is from IMX8MQ_CLK_IPG_ROOT,
assign it explicitly instead of using IMX8MQ_CLK_DUMMY.

Fixes: 748f908cc882 ("arm64: add basic DTS for i.MX8MQ")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Add fixes tag.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 04115ca..55a3d1c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -850,7 +850,7 @@
 				             "fsl,imx7d-usdhc";
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MQ_CLK_DUMMY>,
+				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
 				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
 				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
@@ -867,7 +867,7 @@
 				             "fsl,imx7d-usdhc";
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MQ_CLK_DUMMY>,
+				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
 				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
 				         <&clk IMX8MQ_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
-- 
2.7.4
