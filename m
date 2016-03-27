From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-udoo: add 7 inch LCD touchscreen panel
 support
Date: Sun, 27 Mar 2016 17:51:13 +0200
Message-ID: <56F80171.40708@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The official UDOO board kit has 7 and 15.6 inch touchscreen LCD panels
as options.

This patch adds support for 7 inch panel only, but the 15.6 inch one
should be easy to add using the same regulator, backlight device and
LVDS channel.

Since this panel is an option for UDOO board it is disabled by default
and can be enabled (for example) by the following U-Boot commands:
fdt set backlight status okay
fdt set panelchan status okay
fdt set panel7 status okay
fdt set touchscreenp7 status okay

The LVDS channel is also disabled by default to avoid warning from its
driver.

Signed-off-by: Maciej S. Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 96 +++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index d3e54e40a017..6a0a7ddb59ae 100644
--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
@@ -10,6 +10,13 @@
  */
 
 / {
+	aliases {
+		backlight = &backlight;
+		panelchan = &panelchan;
+		panel7 = &panel7;
+		touchscreenp7 = &touchscreenp7;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
@@ -33,6 +40,14 @@
 			startup-delay-us = <2>; /* USB2415 requires a POR of 1 us minimum */
 			gpio = <&gpio7 12 0>;
 		};
+
+		reg_panel: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "lcd_panel";
+			enable-active-high;
+			gpio = <&gpio1 2 0>;
+		};
 	};
 
 	sound {
@@ -46,6 +61,34 @@
 		mux-int-port = <1>;
 		mux-ext-port = <6>;
 	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpio1 4 0>;
+		default-on;
+		status = "disabled";
+	};
+
+	panel7: panel7 {
+		/*
+		 * in reality it is a -20t (parallel) model,
+		 * but with LVDS bridge chip attached,
+		 * so it is equivalent to -19t model in drive
+		 * characteristics
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+		compatible = "urt,umsh-8596md-19t";
+		power-supply = <&reg_panel>;
+		backlight = <&backlight>;
+		status = "disabled";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
 };
 
 &fec {
@@ -151,6 +194,27 @@
 				MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
 			>;
 		};
+
+		pinctrl_panel: panelgrp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x70
+				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x70
+			>;
+		};
+
+		pinctrl_i2c3: i2c3grp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001f8b1
+				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001f8b1
+			>;
+		};
+
+		pinctrl_touchscreenp7: touchscreenp7grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD2_DAT0__GPIO1_IO15		0x70
+				MX6QDL_PAD_SD2_DAT2__GPIO1_IO13		0x1b0b0
+			>;
+		};
 	};
 };
 
@@ -189,3 +253,35 @@
 	ac97-gpios = <&gpio4 19 0 &gpio4 18 0 &gpio2 30 0>;
 	status = "okay";
 };
+
+&ldb {
+	status = "okay";
+
+	panelchan: lvds-channel@0 {
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	touchscreenp7: touchscreenp7@55 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreenp7>;
+		compatible = "sitronix,st1232";
+		reg = <0x55>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 8>;
+		gpios = <&gpio1 15 0>;
+		status = "disabled";
+	};
+};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
