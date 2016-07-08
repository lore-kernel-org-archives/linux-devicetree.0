From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 05/15] ARM: dts: sun5i: reference-design-tablet: Remove mention of q8
Date: Fri,  8 Jul 2016 18:05:46 +0200
Message-ID: <1467993956-19535-6-git-send-email-hdegoede@redhat.com>
References: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467993956-19535-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove all mention of q8 from sun5i-reference-design-tablet.dtsi.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
index e78452c..20cc940 100644
--- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
@@ -98,7 +98,7 @@
 
 &mmc0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_q8>;
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
 	vmmc-supply = <&reg_vcc3v0>;
 	bus-width = <4>;
 	cd-gpios = <&pio 6 0 GPIO_ACTIVE_HIGH>; /* PG0 */
@@ -118,7 +118,7 @@
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
-	mmc0_cd_pin_q8: mmc0_cd_pin@0 {
+	mmc0_cd_pin: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
