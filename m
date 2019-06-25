From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] arm64: dts: imx8mm: Init rates and parents configs for clocks
Date: Tue, 25 Jun 2019 16:26:31 +0300
Message-ID: <1561469191-26840-1-git-send-email-abel.vesa@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the initial configuration for clocks that need default parent and rate
setting. This is based on the vendor tree clock provider parents and rates
configuration except this is doing the setup in dts rather than using clock
consumer API in a clock provider driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a741..ab92108 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -451,6 +451,42 @@
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				assigned-clocks = <&clk IMX8MM_CLK_AUDIO_AHB>,
+						<&clk IMX8MM_CLK_IPG_AUDIO_ROOT>,
+						<&clk IMX8MM_SYS_PLL3>,
+						<&clk IMX8MM_VIDEO_PLL1>,
+						<&clk IMX8MM_CLK_NOC>,
+						<&clk IMX8MM_CLK_PCIE1_CTRL>,
+						<&clk IMX8MM_CLK_PCIE1_PHY>,
+						<&clk IMX8MM_CLK_CSI1_CORE>,
+						<&clk IMX8MM_CLK_CSI1_PHY_REF>,
+						<&clk IMX8MM_CLK_CSI1_ESC>,
+						<&clk IMX8MM_CLK_DISP_AXI>,
+						<&clk IMX8MM_CLK_DISP_APB>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>,
+						<0>,
+						<0>,
+						<0>,
+						<&clk IMX8MM_SYS_PLL3_OUT>,
+						<&clk IMX8MM_SYS_PLL2_250M>,
+						<&clk IMX8MM_SYS_PLL2_100M>,
+						<&clk IMX8MM_SYS_PLL2_1000M>,
+						<&clk IMX8MM_SYS_PLL2_1000M>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_SYS_PLL2_1000M>,
+						<&clk IMX8MM_SYS_PLL1_800M>;
+				assigned-clock-rates = <400000000>,
+							<400000000>,
+							<750000000>,
+							<594000000>,
+							<0>,
+							<0>,
+							<0>,
+							<0>,
+							<0>,
+							<0>,
+							<500000000>,
+							<200000000>;
 			};
 
 			src: reset-controller@30390000 {
-- 
2.7.4
