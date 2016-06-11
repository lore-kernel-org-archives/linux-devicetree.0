From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] ARM: dts: sun8i-a23-polaroid-mid2809pxe04: Add full otg support
Date: Sat, 11 Jun 2016 15:53:05 +0200
Message-ID: <1465653186-953-6-git-send-email-hdegoede@redhat.com>
References: <1465653186-953-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465653186-953-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we've all the necessary bits in place we can enable
full otg support on these tablets.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts   | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
index cb5daaf..bae779f 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
@@ -131,6 +131,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
+
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PH8";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
 };
 
 &pwm {
@@ -148,6 +155,7 @@
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		eldoin-supply = <&reg_dcdc1>;
+		x-powers,drive-vbus-en;
 	};
 };
 
@@ -219,6 +227,11 @@
 	regulator-name = "vcc-dram";
 };
 
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
 &reg_rtc_ldo {
 	regulator-name = "vcc-rtc";
 };
@@ -227,17 +240,20 @@
 	vcc-lcd-supply = <&reg_dc1sw>;
 };
 
-/*
- * FIXME for now we only support host mode and rely on u-boot to have
- * turned on Vbus which is controlled by the axp223 pmic on the board.
- *
- * Once we have axp223 support we should switch to fully supporting otg.
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
+	usb0_id_det-gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_drivevbus>;
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
