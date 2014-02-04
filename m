From: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Subject: [PATCH v2] Phytec phyFLEX-i.MX6 : Added USB_OTG Support
Date: Tue, 4 Feb 2014 09:09:44 +0530
Message-ID: <1391485184-3589-1-git-send-email-ashutosh.s@phytec.in>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for USB_OTG on Phytec phyFLEX-i.MX6 Quad module.

Signed-off-by: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-phytec-pbab01.dts  |    4 ++++
 arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
index 7d37ec6..87c3702 100644
--- a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
+++ b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
@@ -25,6 +25,10 @@
 	status = "okay";
 };
 
+&usbotg {
+	status = "okay";
+};
+
 &usdhc2 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
index 1a3b50d..e682bf8 100644
--- a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
@@ -18,6 +18,15 @@
 	memory {
 		reg = <0x10000000 0x80000000>;
 	};
+
+	reg_usb_otg_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio4 15 0>;
+		enable-active-low;
+	};
 };
 
 &ecspi3 {
@@ -134,6 +143,7 @@
 				MX6QDL_PAD_EIM_D23__GPIO3_IO23 0x80000000
 				MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24 0x80000000 /* SPI NOR chipselect */
 				MX6QDL_PAD_DI0_PIN15__GPIO4_IO17  0x80000000 /* PMIC interrupt */
+				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15   0x80000000 /* USB_OTG_PWR_EN */
 			>;
 		};
 	};
@@ -162,6 +172,14 @@
 	status = "disabled";
 };
 
+&usbotg {
+	vbus-supply = <&reg_usb_otg_vbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg_1>;
+	disable-over-current;
+	status = "disabled";
+};
+
 &usdhc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc2_2>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
