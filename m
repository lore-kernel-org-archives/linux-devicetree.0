From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sun5i-a13-inet98v-rev2: Remove mmc2 node
Date: Thu, 10 Mar 2016 22:38:02 +0100
Message-ID: <1457645884-10282-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The sun5i-a13-inet98v-rev2 does not have an emmc, it uses nand, the
mmc2 node in the dts comes from a copy and paste error from the
utoo-p66 dts, remove it.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts b/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
index 6fa54b6..1b11ec9 100644
--- a/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
+++ b/arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts
@@ -123,21 +123,6 @@
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
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
