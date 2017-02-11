From: Willy Tarreau <w@1wt.eu>
Subject: ARM: dts: rockchip: add the MiQi board's fan definition
Date: Sat, 11 Feb 2017 09:56:55 +0100
Message-ID: <1486803415-14680-1-git-send-email-w@1wt.eu>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Willy Tarreau <w@1wt.eu>
List-Id: devicetree@vger.kernel.org

The MiQi board is sold with an enclosure in which a fan is connected
to the second LED output, and configured by default in "heartbeat"
mode so that it rotates slowly and increases when the CPU load
increases, ensuring appropriate cooling by default. This LED output
is called "Fan" in the original kernel and connected to GPIO18
(gpiochip 0, pin 18). Here we called it "miqi:green:fan" to stay
consistent with the kernel's naming conventions.

It's worth noting that without this patch the fan doesn't work at
all, risking to make the board overheat.

Fixes: 162718c (v4.7)
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 arch/arm/boot/dts/rk3288-miqi.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-miqi.dts b/arch/arm/boot/dts/rk3288-miqi.dts
index 2f4c635..ef702db 100644
--- a/arch/arm/boot/dts/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rk3288-miqi.dts
@@ -67,6 +67,12 @@
 	leds {
 		compatible = "gpio-leds";
 
+		fan {
+			gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+			label = "miqi:green:fan";
+			linux,default-trigger = "heartbeat";
+		};
+
 		work {
 			gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
 			label = "miqi:green:user";
-- 
2.8.0.rc2.1.gbe9624a

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
