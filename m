From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: sun8i: Rename reference-design-tablet touchscreen node
Date: Fri, 26 Aug 2016 16:42:26 +0200
Message-ID: <20160826144226.29969-4-hdegoede@redhat.com>
References: <20160826144226.29969-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160826144226.29969-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename the reference-design-tablet touchscreen node from gsl1680 to
touchscreen, all? tablets seem to use the same power and interrupt
gpio-s, but not all tablets use a gsl1680 controller making the
gsl1680 name somewhat misleading.

Also move the reg and compatible property to the actual tablet dts
as they may differ per tablet.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
index f29897c..08cd001 100644
--- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
@@ -71,15 +71,13 @@
 	 */
 	clock-frequency = <400000>;
 
-	gsl1680: touchscreen@40 {
-		compatible = "silead,gsl1680";
-		reg = <0x40>;
+	touchscreen: touchscreen@0 {
 		interrupt-parent = <&pio>;
 		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_power_pin>;
 		power-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
-		/* Most tablets use this touchscreen, but not all */
+		/* Tablet dts must provide reg and compatible */
 		status = "disabled";
 	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
