From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] ARM: dts: sun8i: reference-design-tablet: Add gsl1680 touchscreen node
Date: Mon,  8 Aug 2016 21:43:13 +0200
Message-ID: <1470685398-14568-3-git-send-email-hdegoede@redhat.com>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470685398-14568-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Almost all sun8i tablets use a gsl1680 touchscreen controller, so add
a node describing it to reference-design-tablet.dtsi.

Almost all, but not all, so mark it as disabled by default (dts files
will also need to supply a firmware-name and resolution info).

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../boot/dts/sun8i-reference-design-tablet.dtsi    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
index 9d90361..f29897c 100644
--- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
@@ -63,6 +63,27 @@
 	};
 };
 
+&i2c0 {
+	/*
+	 * The gsl1680 is rated at 400KHz and it will not work reliable at
+	 * 100KHz, this has been confirmed on multiple different q8 tablets.
+	 * The gsl1680 is the only device on this bus.
+	 */
+	clock-frequency = <400000>;
+
+	gsl1680: touchscreen@40 {
+		compatible = "silead,gsl1680";
+		reg = <0x40>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_power_pin>;
+		power-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
+		/* Most tablets use this touchscreen, but not all */
+		status = "disabled";
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
@@ -88,6 +109,13 @@
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
+	ts_power_pin: ts_power_pin@0 {
+		allwinner,pins = "PH1";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH8";
 		allwinner,function = "gpio_in";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
