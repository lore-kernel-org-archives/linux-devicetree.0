From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: sun5i-a13-empire-electronix-d709: Remove mmc2 node
Date: Thu, 10 Mar 2016 22:38:03 +0100
Message-ID: <1457645884-10282-2-git-send-email-hdegoede@redhat.com>
References: <1457645884-10282-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457645884-10282-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The empire-electronix-d709 does not have an emmc, it uses nand, the
mmc2 node in the dts comes from a copy and paste error from the
inet98fv2 dts, remove it.

While at it also do s/inet98fv2/d709/ to fix some other copy/paste
leftovers.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../arm/boot/dts/sun5i-a13-empire-electronix-d709.dts | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
index 7fbb0b0..6efbba6 100644
--- a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
+++ b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
@@ -123,7 +123,7 @@
 
 &mmc0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_inet98fv2>;
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_d709>;
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
 	cd-gpios = <&pio 6 0 GPIO_ACTIVE_HIGH>; /* PG0 */
@@ -131,27 +131,12 @@
 	status = "okay";
 };
 
-&mmc2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_pins_a>;
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-
-	mmccard: mmccard@0 {
-		reg = <0>;
-		compatible = "mmc-card";
-		broken-hpi;
-	};
-};
-
 &otg_sram {
 	status = "okay";
 };
 
 &pio {
-	mmc0_cd_pin_inet98fv2: mmc0_cd_pin@0 {
+	mmc0_cd_pin_d709: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
