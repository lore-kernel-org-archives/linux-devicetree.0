From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: hummingboard/cubox-i: move usb otg
 configuration to platform level
Date: Wed, 11 Jun 2014 10:58:17 +0100
Message-ID: <E1WufIP-0007yq-6R@rmk-PC.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The configuration of the USB OTG is a platform configuration decision,
not a microsom decision.  Move this configuration out to the platform
level files.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard.dts | 10 ++++++++++
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 10 ++++++++++
 arch/arm/boot/dts/imx6qdl-microsom.dtsi   | 13 -------------
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
index cb9691bac161..bcae32fdc4c1 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
@@ -143,6 +143,14 @@
 			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x1b0b0>;
 		};
 
+		pinctrl_hummingboard_usbotg_id: hummingboard-usbotg-id {
+			/*
+			 * Similar to pinctrl_usbotg_2, but we want it
+			 * pulled down for a fixed host connection.
+			 */
+			fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
+		};
+
 		pinctrl_hummingboard_usbotg_vbus: hummingboard-usbotg-vbus {
 			fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b0>;
 		};
@@ -182,6 +190,8 @@
 };
 
 &usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hummingboard_usbotg_id>;
 	vbus-supply = <&reg_usbotg_vbus>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index f45380073973..b53cd8c6c44d 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -134,6 +134,14 @@
 			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x4001b0b0>;
 		};
 
+		pinctrl_cubox_i_usbotg_id: cubox-i-usbotg-id {
+			/*
+			 * The Cubox-i pulls this low, but as it's pointless
+			 * leaving it as a pull-up, even if it is just 10uA.
+			 */
+			fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
+		};
+
 		pinctrl_cubox_i_usbotg_vbus: cubox-i-usbotg-vbus {
 			fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x4001b0b0>;
 		};
@@ -192,6 +200,8 @@
 };
 
 &usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cubox_i_usbotg_id>;
 	vbus-supply = <&reg_usbotg_vbus>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6qdl-microsom.dtsi b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
index a5d72895d9ce..bf5a45b0a61f 100644
--- a/arch/arm/boot/dts/imx6qdl-microsom.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
@@ -80,14 +80,6 @@
 			>;
 		};
 
-		pinctrl_microsom_usbotg: microsom-usbotg {
-			/*
-			 * Similar to pinctrl_usbotg_2, but we want it
-			 * pulled down for a fixed host connection.
-			 */
-			fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
-		};
-
 		pinctrl_microsom_usdhc1: microsom-usdhc1 {
 			fsl,pins = <
 				MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17059
@@ -114,11 +106,6 @@
 	fsl,uart-has-rtscts;
 };
 
-&usbotg {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_microsom_usbotg>;
-};
-
 /* USDHC1 - Connected to optional BRCM Wifi/BT/FM */
 &usdhc1 {
 	card-external-vcc-supply = <&reg_brcm>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
