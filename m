From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v8 2/4] ARM: dts: imx27 phyCARD-S pinctrl
Date: Wed, 20 Nov 2013 09:45:49 +0100
Message-ID: <1384937151-11160-3-git-send-email-mpa@pengutronix.de>
References: <1384937151-11160-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384937151-11160-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes and properties for phyCARD-S device nodes.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts | 43 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts | 16 +++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
index 5a31c77..5289680 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
@@ -54,6 +54,8 @@
 };
 
 &i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
 	rtc@51 {
@@ -68,7 +70,42 @@
 	};
 };
 
+&iomuxc {
+	imx27-phycard-s-rdk {
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins = <MX27_I2C2_PINGRP1>;
+		};
+
+		pinctrl_owire1: owire1grp {
+			fsl,pins = <MX27_OWIRE1_PINGRP1>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins = <
+				MX27_UART1_PINGRP1
+				MX27_UART1_RTSCTS_PINGRP1
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins = <
+				MX27_UART2_PINGRP1
+				MX27_UART2_RTSCTS_PINGRP1
+			>;
+		};
+
+		pinctrl_uart3: uart3grp {
+			fsl,pins = <
+				MX27_UART3_PINGRP1
+				MX27_UART3_RTSCTS_PINGRP1
+			>;
+		};
+	};
+};
+
 &owire {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_owire1>;
 	status = "okay";
 };
 
@@ -79,15 +116,21 @@
 
 &uart1 {
 	fsl,uart-has-rtscts;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
 
 &uart2 {
 	fsl,uart-has-rtscts;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
 &uart3 {
 	fsl,uart-has-rtscts;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
index c8d57d1..62e7fcb 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
@@ -29,11 +29,27 @@
 	status = "okay";
 };
 
+&iomuxc {
+	imx27-phycard-s-som {
+		pinctrl_fec1: fec1grp {
+			fsl,pins = <MX27_FEC1_PINGRP1>;
+		};
+
+		pinctrl_i2c2: i2c2grp {
+			fsl,pins = <MX27_I2C2_PINGRP1>;
+		};
+	};
+};
+
 &fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
 	status = "okay";
 };
 
 &i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
 	at24@52 {
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
