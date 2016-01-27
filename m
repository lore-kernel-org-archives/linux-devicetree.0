From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: imx6*-hummingboard: use proper gpio flags
 definitions
Date: Wed, 27 Jan 2016 20:23:55 +0000
Message-ID: <E1aOWd9-00058U-T6@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use proper gpio flag definitions for GPIOs rather than using opaque
uninformative numbers.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index 81be050c8d3c..3a06516fe7a9 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -48,7 +48,7 @@
 
 	ir_recv: ir-receiver {
 		compatible = "gpio-ir-receiver";
-		gpios = <&gpio3 5 1>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard_gpio3_5>;
 	};
@@ -67,7 +67,7 @@
 		reg_usbh1_vbus: usb-h1-vbus {
 			compatible = "regulator-fixed";
 			enable-active-high;
-			gpio = <&gpio1 0 0>;
+			gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_hummingboard_usbh1_vbus>;
 			regulator-name = "usb_h1_vbus";
@@ -78,7 +78,7 @@
 		reg_usbotg_vbus: usb-otg-vbus {
 			compatible = "regulator-fixed";
 			enable-active-high;
-			gpio = <&gpio3 22 0>;
+			gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_hummingboard_usbotg_vbus>;
 			regulator-name = "usb_otg_vbus";
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
