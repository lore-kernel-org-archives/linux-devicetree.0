From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: sun4i: Disable ohci1 on ba10-tv-box
Date: Fri, 26 Aug 2016 16:42:23 +0200
Message-ID: <20160826144226.29969-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ehci1/ohci1 pair on the ba10-tv-box is connected to an USB-2 wifi
module soldered on the PCB, so there enabling ohci1 is not necessary.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts b/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
index f3cb297..5f98582 100644
--- a/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
+++ b/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
@@ -121,10 +121,6 @@
 	status = "okay";
 };
 
-&ohci1 {
-	status = "okay";
-};
-
 &otg_sram {
 	status = "okay";
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
