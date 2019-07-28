From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3] arm64: dts: imx8mq: Init rates and parents configs for clocks
Date: Sun, 28 Jul 2019 17:12:18 +0300
Message-ID: <20190728141218.12702-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, ccaione@baylibre.com, abel.vesa@nxp.com, baruch@tkos.co.il, andrew.smirnov@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca, agx@sigxcpu.org, Anson.Huang@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Abel Vesa <abel.vesa@nxp.com>

Add the initial configuration for clocks that need default parent and rate
setting. This is based on the vendor tree clock provider parents and rates
configuration except this is doing the setup in dts rather then using clock
consumer API in a clock provider driver.

Note that by adding the initial rate setting for audio_pll1/audio_pll
setting we need to remove it from imx8mq-librem5-devkit.dts
imx8mq-librem5-devkit.dts

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v2:
	- set rate for audio_pll1/audio_pll2  in the dtsi file and
	remove the setting from imx8mq-librem5-devkit.dts

 .../dts/freescale/imx8mq-librem5-devkit.dts   |  5 -----
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 683a11035643..c702ccc82867 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -169,11 +169,6 @@
 	};
 };
 
-&clk {
-	assigned-clocks = <&clk IMX8MQ_AUDIO_PLL1>, <&clk IMX8MQ_AUDIO_PLL2>;
-	assigned-clock-rates = <786432000>, <722534400>;
-};
-
 &dphy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 02fbd0625318..c67625a881a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -494,6 +494,27 @@
 				clock-names = "ckil", "osc_25m", "osc_27m",
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
+				assigned-clocks = <&clk IMX8MQ_VIDEO_PLL1>,
+					<&clk IMX8MQ_AUDIO_PLL1>,
+					<&clk IMX8MQ_AUDIO_PLL2>,
+					<&clk IMX8MQ_CLK_AHB>,
+					<&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					<&clk IMX8MQ_CLK_AUDIO_AHB>,
+					<&clk IMX8MQ_VIDEO_PLL1_REF_SEL>,
+					<&clk IMX8MQ_CLK_NOC>;
+				assigned-clock-parents = <0>,
+						<0>,
+						<0>,
+						<&clk IMX8MQ_SYS1_PLL_133M>,
+						<&clk IMX8MQ_SYS1_PLL_266M>,
+						<&clk IMX8MQ_SYS2_PLL_500M>,
+						<&clk IMX8MQ_CLK_27M>,
+						<&clk IMX8MQ_SYS1_PLL_800M>;
+				assigned-clock-rates = <593999999>,
+						<786432000>,
+						<722534400>;
+
+
 			};
 
 			src: reset-controller@30390000 {
-- 
2.17.1
