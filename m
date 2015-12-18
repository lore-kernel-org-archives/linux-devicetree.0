From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 5/5] ARM: dts: imx6qdl-udoo.dtsi: fix onboard USB HUB property
Date: Fri, 18 Dec 2015 17:33:59 +0800
Message-ID: <1450431239-16439-6-git-send-email-peter.chen@freescale.com>
References: <1450431239-16439-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450431239-16439-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current dts describes USB HUB's property at USB controller's
entry, it is improper. The USB HUB should be the child node
under USB controller.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index 1211da8..7155afb 100644
--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
@@ -9,6 +9,8 @@
  *
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	chosen {
 		stdout-path = &uart2;
@@ -17,23 +19,6 @@
 	memory {
 		reg = <0x10000000 0x40000000>;
 	};
-
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb_h1_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb_h1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			startup-delay-us = <2>; /* USB2415 requires a POR of 1 us minimum */
-			gpio = <&gpio7 12 0>;
-		};
-	};
 };
 
 &fec {
@@ -119,11 +104,19 @@
 };
 
 &usbh1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usbh>;
-	vbus-supply = <&reg_usb_h1_vbus>;
-	clocks = <&clks 201>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	hub: usb2415@01 {
+		compatible = "generic-onboard-device";
+		reg = <0x01>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh>;
+		clocks = <&clks IMX6QDL_CLK_CKO>;
+		reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+		reset-duration-us = <2>;
+	};
 };
 
 &usdhc3 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
