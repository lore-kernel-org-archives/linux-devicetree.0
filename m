From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 15/20] ARM: dts: imx6*-hummingboard2: rework regulators
Date: Mon, 11 Dec 2017 16:58:34 +0000
Message-ID: <E1eORPW-0000IX-CT@rmk-PC.armlinux.org.uk>
References: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211165631.GW10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

Name the regulators according to the voltage rails they are feeding in
the schematic. The USB 2-4 regulators are fixed regulators and are always
on, as they are not a VBUS supply for a single USB host port on the i.MX6,
but supply VBUS to ports behind a USB hub and there is currently no way
to model this in mainline.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
index 6fbfa970a0a7..52ed580cf64a 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
@@ -54,7 +54,7 @@
 
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
-		regulator-name = "3P3V";
+		regulator-name = "VCC_3V2";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
@@ -62,7 +62,7 @@
 
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
-		regulator-name = "1P8V";
+		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
@@ -80,15 +80,16 @@
 		startup-delay-us = <1000>;
 	};
 
-	reg_usbh1_vbus: regulator-usb-h1-vbus {
+	reg_usbh2_vbus: regulator-usb-h1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh1_vbus>;
-		regulator-name = "usb_h1_vbus";
+		regulator-name = "V_USB2";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
 	reg_usbotg_vbus: regulator-usb-otg-vbus {
@@ -97,33 +98,33 @@
 		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbotg_vbus>;
-		regulator-name = "usb_otg_vbus";
+		regulator-name = "V_USB1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
 
-	reg_usbh2_vbus: regulator-usb-h2-vbus {
-		compatible = "regulator-gpio";
+	reg_usbh3_vbus: regulator-usb-h2-vbus {
+		compatible = "regulator-fixed";
 		enable-active-high;
 		enable-gpio = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh2_vbus>;
-		regulator-name = "usb_h2_vbus";
+		regulator-name = "V_USB3";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
+		regulator-always-on;
 	};
 
-	reg_usbh3_vbus: regulator-usb-h3-vbus {
-		compatible = "regulator-gpio";
+	reg_usbh4_vbus: regulator-usb-h3-vbus {
+		compatible = "regulator-fixed";
 		enable-active-high;
 		enable-gpio = <&gpio7 10 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh3_vbus>;
-		regulator-name = "usb_h3_vbus";
+		regulator-name = "V_USB4";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	sound-sgtl5000 {
@@ -484,7 +485,6 @@
 
 &usbh1 {
 	disable-over-current;
-	vbus-supply = <&reg_usbh1_vbus>;
 	status = "okay";
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
