From: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
Subject: [PATCH v2 1/1] ARM: dts: imx6q-bx50v3: Enable i2c recovery mechanism
Date: Thu, 10 Aug 2017 13:42:29 +0300
Message-ID: <622b0df0cfc7ed6fe3510ea8a2ef07fb7073bee5.1502360101.git.jose.alarcon@ge.com>
References: <cover.1502360101.git.jose.alarcon@ge.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502360101.git.jose.alarcon-JJi787mZWgc@public.gmane.org>
In-Reply-To: <cover.1502360101.git.jose.alarcon-JJi787mZWgc@public.gmane.org>
References: <cover.1502360101.git.jose.alarcon-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, nandor.han-JJi787mZWgc@public.gmane.org, Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit enables i2c recovery, supported by the i2c core subsystem.
It defines the required GPIOs for SDA and SLC lines.

Signed-off-by: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index c90b26f..1015e55 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -111,6 +111,11 @@
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
@@ -261,6 +266,43 @@
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
+	sda-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+};
+
+&iomuxc {
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x1b0b0
+			MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27	0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12	0x1b0b0
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13	0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__GPIO1_IO03	0x1b0b0
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06	0x1b0b0
+		>;
+	};
+};
+
 &usdhc4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc4>;
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
