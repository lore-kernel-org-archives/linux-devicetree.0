From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i-q8-common: Add support for USB wifi controllers
Date: Wed, 15 Jun 2016 20:23:50 +0200
Message-ID: <1466015030-18091-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some of the sun8i q8 boards have an usb wifi controller, on other
variants this will result in an used usb root-hub, but the best
way to deal with wifi on this boards is to simply let the kernel
auto-detect usb or sdio wifi controllers.

This has been tested on an a23 based q8 tablet with a RTL8188ETV wifi
controller.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-q8-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
index 991087f..f3f4ce0 100644
--- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -63,6 +63,10 @@
 	};
 };
 
+&ehci0 {
+	status  = "okay";
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_q8>;
@@ -171,6 +175,12 @@
 	regulator-name = "vcc-dram";
 };
 
+&reg_dldo1 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-wifi";
+};
+
 &reg_drivevbus {
 	regulator-name = "usb0-vbus";
 	status = "okay";
@@ -205,5 +215,6 @@
 	usb0_id_det-gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
 	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_drivevbus>;
+	usb1_vbus-supply = <&reg_dldo1>;
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
