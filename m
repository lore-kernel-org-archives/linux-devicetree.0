From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq: Init rates and parents configs for clocks
Date: Tue, 25 Jun 2019 15:51:21 +0300
Message-ID: <1561467081-25701-1-git-send-email-abel.vesa@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the initial configuration for clocks that need default parent and rate
setting. This is based on the vendor tree clock provider parents and rates
configuration except this is doing the setup in dts rather then using clock
consumer API in a clock provider driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808..e0abe02 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -489,6 +489,40 @@
 				clock-names = "ckil", "osc_25m", "osc_27m",
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
+				assigned-clocks = <&clk IMX8MQ_VIDEO_PLL1>,
+					<&clk IMX8MQ_CLK_AHB>,
+					<&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					<&clk IMX8MQ_CLK_AUDIO_AHB>,
+					<&clk IMX8MQ_VIDEO_PLL1_REF_SEL>,
+					<&clk IMX8MQ_CLK_NOC>,
+					<&clk IMX8MQ_CLK_PCIE1_CTRL>,
+					<&clk IMX8MQ_CLK_PCIE1_PHY>,
+					<&clk IMX8MQ_CLK_PCIE2_CTRL>,
+					<&clk IMX8MQ_CLK_PCIE2_PHY>,
+					<&clk IMX8MQ_CLK_CSI1_CORE>,
+					<&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+					<&clk IMX8MQ_CLK_CSI1_ESC>,
+					<&clk IMX8MQ_CLK_CSI2_CORE>,
+					<&clk IMX8MQ_CLK_CSI2_PHY_REF>,
+					<&clk IMX8MQ_CLK_CSI2_ESC>;
+				assigned-clock-parents = <0>,
+						<&clk IMX8MQ_SYS1_PLL_133M>,
+						<&clk IMX8MQ_SYS1_PLL_266M>,
+						<&clk IMX8MQ_SYS2_PLL_500M>,
+						<&clk IMX8MQ_CLK_27M>,
+						<&clk IMX8MQ_SYS1_PLL_800M>,
+						<&clk IMX8MQ_SYS2_PLL_250M>,
+						<&clk IMX8MQ_SYS2_PLL_100M>,
+						<&clk IMX8MQ_SYS2_PLL_250M>,
+						<&clk IMX8MQ_SYS2_PLL_100M>,
+						<&clk IMX8MQ_SYS1_PLL_266M>,
+						<&clk IMX8MQ_SYS2_PLL_1000M>,
+						<&clk IMX8MQ_SYS1_PLL_800M>,
+						<&clk IMX8MQ_SYS1_PLL_266M>,
+						<&clk IMX8MQ_SYS2_PLL_1000M>,
+						<&clk IMX8MQ_SYS1_PLL_800M>;
+				assigned-clock-rates = <593999999>;
+
 			};
 
 			src: reset-controller@30390000 {
-- 
2.7.4
