From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sx-sabreauto: add egalax touch screen support
Date: Fri, 27 Apr 2018 15:20:50 +0800
Message-ID: <1524813650-19241-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, haibo.chen@nxp.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Add egalax touch screen support on i2c2 bus.

Signed-off-by: Haibo Chen <haibo.chen@freescale.com>
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
this patch is based on patch (ARM: dts: imx6sx-sabreauto: add debug LED support) I sent out for review.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index 6b94f24..2f6e474 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -131,6 +131,12 @@
 &iomuxc {
 	imx6x-sabreauto {
 
+		pinctrl_egalax_int: egalax_intgrp {
+			fsl,pins = <
+				MX6SX_PAD_SD4_RESET_B__GPIO6_IO_22      0x80000000
+			>;
+		};
+
 		pinctrl_led: ledgrp {
 			fsl,pins = <
 				MX6SX_PAD_CSI_PIXCLK__GPIO1_IO_24 0x17059
@@ -274,6 +280,16 @@
 	pinctrl-0 = <&pinctrl_i2c2_1>;
 	status = "okay";
 
+	egalax_ts@04 {
+		compatible = "eeti,egalax_ts";
+		reg = <0x04>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_egalax_int>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <22 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-gpios = <&gpio6 22 GPIO_ACTIVE_HIGH>;
+	};
+
 	max7322: gpio@68 {
 		compatible = "maxim,max7322";
 		reg = <0x68>;
-- 
2.7.4
