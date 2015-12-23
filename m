From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 7/7] ARM: dts: imx: Add support for Advantech/GE B850v3
Date: Wed, 23 Dec 2015 17:00:16 -0500
Message-ID: <1450908016-17384-8-git-send-email-akshay.bhat@timesys.com>
References: <1450908016-17384-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450908016-17384-1-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for Advantech/GE B850v3 board.

Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/imx6q-b850v3.dts | 157 +++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-b850v3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 684a504..b6c6d7a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -319,6 +319,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
 	imx6q-b650v3.dtb \
+	imx6q-b850v3.dtb \
 	imx6q-cm-fx6.dtb \
 	imx6q-cubox-i.dtb \
 	imx6q-dfi-fs700-m60.dtb \
diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
new file mode 100644
index 0000000..318ba65
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -0,0 +1,157 @@
+/*
+ * Copyright 2015 Timesys Corporation.
+ * Copyright 2015 General Electric Company
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include "imx6q-bx50v3.dtsi"
+
+/ {
+	model = "General Electric B850v3";
+	compatible = "ge,imx6q-b850v3", "advantech,imx6q-ba16", "fsl,imx6q";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	panel_lvds0 {
+		compatible = "auo,b133htn01";
+		backlight = <&backlight_lvds>;
+		ddc-i2c-bus = <&mux_i2c12>;
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&ldb {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
+				 <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+	fsl,dual-channel;
+	status = "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pca9547_ddc: mux@70 {
+		compatible = "nxp,pca9547";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mux_i2c11: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+
+		mux_i2c12: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+
+		mux_i2c13: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+
+		mux_i2c14: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+
+		mux_i2c15: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+
+		mux_i2c16: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+		};
+
+		mux_i2c17: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+
+		mux_i2c18: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+		};
+	};
+};
+
+&hdmi {
+	ddc-i2c-bus = <&mux_i2c11>;
+};
+
+&mux_i2c3 {
+	ads7830_2: ads7830@4a {
+		compatible = "ti,ads7830";
+		reg = <0x4a>;
+	};
+};
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
