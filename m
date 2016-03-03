From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: imx6qdl-udoo.dtsi: fix onboard USB HUB property
Date: Thu, 3 Mar 2016 18:01:16 +0800
Message-ID: <1456999276-6315-4-git-send-email-peter.chen@nxp.com>
References: <1456999276-6315-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456999276-6315-1-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

The current dts describes USB HUB's property at USB controller's
entry, it is improper. The USB HUB should be the child node
under USB controller.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index 1211da8..d8a4274 100644
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
+		compatible = "usbxxxx,xxxx";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh>;
+		clocks = <&clks IMX6QDL_CLK_CKO>;
+		reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+		reset-duration-us = <3000>;
+	};
 };
 
 &usdhc3 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
