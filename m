From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: hummingboard/cubox-i: add USB OC pinctrl
 configuration
Date: Sat, 23 Aug 2014 10:11:26 +0100
Message-ID: <E1XL7M6-0002yH-NB@rmk-PC.arm.linux.org.uk>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140823091058.GO30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hummingboard has no over current hardware, so disable the over current
detection for both ports.

Cubox-i has over current hardware, so appropriately configure this.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard.dts |  2 ++
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
index c8e51dd41b8f..d1c892e28296 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
@@ -181,11 +181,13 @@
 };
 
 &usbh1 {
+	disable-over-current;
 	vbus-supply = <&reg_usbh1_vbus>;
 	status = "okay";
 };
 
 &usbotg {
+	disable-over-current;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_usbotg_id>;
 	vbus-supply = <&reg_usbotg_vbus>;
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index e8e781656b3f..298d0fdf8ebe 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -130,16 +130,23 @@
 			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
 		};
 
+		pinctrl_cubox_i_usbh1: cubox-i-usbh1 {
+			fsl,pins = <MX6QDL_PAD_GPIO_3__USB_H1_OC 0x1b0b0>;
+		};
+
 		pinctrl_cubox_i_usbh1_vbus: cubox-i-usbh1-vbus {
 			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x4001b0b0>;
 		};
 
-		pinctrl_cubox_i_usbotg_id: cubox-i-usbotg-id {
+		pinctrl_cubox_i_usbotg: cubox-i-usbotg {
 			/*
-			 * The Cubox-i pulls this low, but as it's pointless
+			 * The Cubox-i pulls ID low, but as it's pointless
 			 * leaving it as a pull-up, even if it is just 10uA.
 			 */
-			fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059
+				MX6QDL_PAD_KEY_COL4__USB_OTG_OC 0x1b0b0
+			>;
 		};
 
 		pinctrl_cubox_i_usbotg_vbus: cubox-i-usbotg-vbus {
@@ -173,13 +180,15 @@
 };
 
 &usbh1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cubox_i_usbh1>;
 	vbus-supply = <&reg_usbh1_vbus>;
 	status = "okay";
 };
 
 &usbotg {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_cubox_i_usbotg_id>;
+	pinctrl-0 = <&pinctrl_cubox_i_usbotg>;
 	vbus-supply = <&reg_usbotg_vbus>;
 	status = "okay";
 };
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
