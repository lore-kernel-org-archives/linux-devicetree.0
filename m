From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6q-bx50v3: Enable i2c recovery mechanism
Date: Wed, 28 Jun 2017 14:35:31 +0200
Message-ID: <20170628123531.26996-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>

This commit enables i2c recovery, supported by the i2c core subsystem.
It defines the required GPIOs for SDA and SLC lines.

Signed-off-by: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index c90b26f..75201ca 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -94,6 +94,29 @@
 	};
 };
 
+&iomuxc {
+        pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x1b0b0
+			MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27	0x1b0b0
+		>;
+	};
+
+        pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12	0x1b0b0
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13	0x1b0b0
+		>;
+	};
+
+        pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__GPIO1_IO03	0x1b0b0
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06	0x1b0b0
+		>;
+	};
+};
+
 &ecspi5 {
 	cs-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
@@ -111,6 +134,11 @@
 };
 
 &i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	sda-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+
 	pca9547: mux@70 {
 		compatible = "nxp,pca9547";
 		reg = <0x70>;
@@ -261,6 +289,20 @@
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	sda-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+};
+
+&i2c3 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	sda-gpios = <&gpio1 06 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 03 GPIO_ACTIVE_HIGH>;
+};
+
 &usdhc4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc4>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
