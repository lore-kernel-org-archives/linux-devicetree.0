From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 1/9] ARM: dts: imx7-colibri: move and rename USB Host power regulator
Date: Wed,  6 Dec 2017 16:29:57 +0100
Message-ID: <20171206153005.6144-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Colibri default which enables USB Host power is not necessarily
tied to the OTG2 controller, some carrier board use the pin to
control USB power for both controllers. Hence name the pinctrl
group more generic.

Also move the regulator to the generic eval-v3 device tree since
the regulator is always on the carrier board. In the Colibri iMX7S
case the regulator is just not used.  This allows to reuse the
regulator in a upcoming SKU Colibri iMX7D 1GB with eMMC.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 11 +++++++++++
 arch/arm/boot/dts/imx7-colibri.dtsi         |  2 +-
 arch/arm/boot/dts/imx7d-colibri-eval-v3.dts | 13 +------------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
index 18bebd6d8d47..5ecb3a858c5a 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -70,6 +70,17 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh_reg>;
+		regulator-name = "VCC_USB[1-4]";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio4 7 GPIO_ACTIVE_LOW>;
+		vin-supply = <&reg_5v0>;
+	};
 };
 
 &bl {
diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index bb5bf94f1a32..60ea7557d8c9 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -559,7 +559,7 @@
 		>;
 	};
 
-	pinctrl_usbotg2_reg: gpio-usbotg2-vbus {
+	pinctrl_usbh_reg: gpio-usbh-vbus {
 		fsl,pins = <
 			MX7D_PAD_UART3_CTS_B__GPIO4_IO7	0x14 /* SODIMM 129 USBH PEN */
 		>;
diff --git a/arch/arm/boot/dts/imx7d-colibri-eval-v3.dts b/arch/arm/boot/dts/imx7d-colibri-eval-v3.dts
index a608a14d8c85..136e11ab4893 100644
--- a/arch/arm/boot/dts/imx7d-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/imx7d-colibri-eval-v3.dts
@@ -48,20 +48,9 @@
 	model = "Toradex Colibri iMX7D on Colibri Evaluation Board V3";
 	compatible = "toradex,colibri-imx7d-eval-v3", "toradex,colibri-imx7d",
 		     "fsl,imx7d";
-
-	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_usbotg2_reg>;
-		regulator-name = "VCC_USB[1-4]";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 7 GPIO_ACTIVE_LOW>;
-		vin-supply = <&reg_5v0>;
-	};
 };
 
 &usbotg2 {
-	vbus-supply = <&reg_usb_otg2_vbus>;
+	vbus-supply = <&reg_usbh_vbus>;
 	status = "okay";
 };
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
