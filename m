From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun5i-a10s-wobo-i5: Enable ldo4 too
Date: Fri,  3 Jun 2016 20:10:40 +0200
Message-ID: <1464977440-23441-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It seems that the wifi chip is powered by both ldo3 and ldo4 tied
together and that using only one results in the wifi-chip dropping of
the USB bus sometimes.

Ideally we would have a proper way of modelling this (this is being
worked on), but currently we do not. This is not an issue since we need
to keep these regulators always-on anyways, due to these boards
crashing when ldo3/4 get turned back on after having been turned off.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
index 9fea918..52d18ca 100644
--- a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
@@ -195,7 +195,14 @@
 	regulator-always-on;
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
-	regulator-name = "vcc-wifi";
+	regulator-name = "vcc-wifi1";
+};
+
+&reg_ldo4 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-wifi2";
 };
 
 &reg_usb1_vbus {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
