From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq-evk: Unbypass audio_pll1
Date: Sun, 28 Jul 2019 17:08:17 +0300
Message-ID: <20190728140817.12509-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, ccaione@baylibre.com, abel.vesa@nxp.com, baruch@tkos.co.il, andrew.smirnov@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

Making audio_pll1 parent of audio_pll1_bypass, will allow
setting rates multiple of 8000 for children.

After unbypass clk hierarchy looks like this:
 * osc_25m
   * audio_pll1
     * audio_pll1_bypass
       * audio_pll1_out
         * sai2
           * sai2_root_clk

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index e3df9b8cd9ca..05958124f173 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -118,9 +118,9 @@
 &sai2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai2>;
-	assigned-clocks = <&clk IMX8MQ_CLK_SAI2>;
-	assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1_OUT>;
-	assigned-clock-rates = <24576000>;
+	assigned-clocks = <&clk IMX8MQ_AUDIO_PLL1_BYPASS>, <&clk IMX8MQ_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1>, <&clk IMX8MQ_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <0>, <24576000>;
 	status = "okay";
 };
 
-- 
2.17.1
