From: daniel.baluta@nxp.com
Subject: [PATCH v4 2/2] arm64: dts: imx8mm-evk: Enable audio codec wm8524
Date: Tue,  4 Jun 2019 20:32:57 +0800
Message-ID: <20190604123257.2920-3-daniel.baluta@nxp.com>
References: <20190604123257.2920-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604123257.2920-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, m.felsch@pengutronix.de, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Daniel Baluta <daniel.baluta@nxp.com>

i.MX8MM has one wm8524 audio codec connected with
SAI3 digital audio interface.

This patch uses simple-card machine driver in order
to enable wm8524 codec.

We need to set:
	* SAI3 pinctrl configuration
	* codec reset gpio pinctrl configuration
	* clock hierarchy
	* codec node
	* simple-card configuration

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index f8ff0a4b8961..7d2ec0326659 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -37,6 +37,37 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	wm8524: audio-codec {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8524";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_wlf>;
+		wlf,mute-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	};
+
+	sound-wm8524 {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm8524-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Line", "Left Line Out Jack",
+			"Line", "Right Line Out Jack";
+		simple-audio-card,routing =
+			"Left Line Out Jack", "LINEVOUTL",
+			"Right Line Out Jack", "LINEVOUTR";
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8524>;
+			clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
+		};
+	};
 };
 
 &A53_0 {
@@ -65,6 +96,15 @@
 	};
 };
 
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	status = "okay";
+};
+
 &uart2 { /* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
@@ -242,6 +282,12 @@
 		>;
 	};
 
+	pinctrl_gpio_wlf: gpiowlfgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0xd6
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
@@ -261,6 +307,15 @@
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC     0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK      0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK        0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0     0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
-- 
2.17.1
