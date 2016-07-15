From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun6i-a31s-colorfly-e708-q1: Add full otg support
Date: Fri, 15 Jul 2016 08:54:19 +0200
Message-ID: <1468565659-17882-2-git-send-email-hdegoede@redhat.com>
References: <1468565659-17882-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468565659-17882-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we've all the necessary bits in place we can enable
full otg support on these tablets.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31s-colorfly-e708-q1.dts | 32 +++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31s-colorfly-e708-q1.dts b/arch/arm/boot/dts/sun6i-a31s-colorfly-e708-q1.dts
index e182eec..9040bb9 100644
--- a/arch/arm/boot/dts/sun6i-a31s-colorfly-e708-q1.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-colorfly-e708-q1.dts
@@ -106,6 +106,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
+
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PA15";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
 };
 
 &p2wi {
@@ -116,6 +123,8 @@
 		reg = <0x68>;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		drivevbus-supply = <&reg_vcc5v0>;
+		x-powers,drive-vbus-en;
 	};
 };
 
@@ -185,24 +194,31 @@
 	regulator-name = "vcc-pg";
 };
 
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
 &simplefb_lcd {
 	vcc-lcd-supply = <&reg_dc1sw>;
 	vcc-pg-supply = <&reg_dldo2>;
 };
 
-/*
- * FIXME for now we only support host mode and rely on u-boot to have
- * turned on Vbus which is controlled by the axp221 pmic on the board.
- *
- * Once we have axp221 power-supply and vbus-usb support we should switch
- * to fully supporting otg.
- */
 &usb_otg {
-	dr_mode = "host";
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
 	status = "okay";
 };
 
 &usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>;
+	usb0_id_det-gpio = <&pio 0 15 GPIO_ACTIVE_HIGH>; /* PA15 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_drivevbus>;
 	usb1_vbus-supply = <&reg_dldo1>;
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
