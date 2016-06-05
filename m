From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sun4i: The blue led on the Mele A1000 is a power led
Date: Sun,  5 Jun 2016 14:23:11 +0200
Message-ID: <1465129393-22379-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The blue led on the Mele A1000 is wired to light up as soon as the board
has powered (it will be on while the gpio is still in input / floating
mode), also its location on the top-set box clearly signals "power led".

Until now we've been treating this as a generic usr function led, which
means that when you plug power into the top-set box, the power-led lights
and then turns off as soon as the kernel loads, which looks wrong.

This renames the led from a1000:blue:usr to a1000:blue:pwr and marks
it as default on, fixing this.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-a1000.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
index fa70b8f..39e368e 100644
--- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
@@ -72,8 +72,9 @@
 		};
 
 		blue {
-			label = "a1000:blue:usr";
+			label = "a1000:blue:pwr";
 			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
