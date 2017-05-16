From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH] arm: aspeed: Use 'ast2500' compatible strings where appropriate
Date: Tue, 16 May 2017 15:59:00 +0800
Message-ID: <20170516075900.23202-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index a0bea4a6ec77..48a092e735d9 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -88,7 +88,7 @@
 		};
 
 		vic: interrupt-controller@1e6c0080 {
-			compatible = "aspeed,ast2400-vic";
+			compatible = "aspeed,ast2500-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			valid-sources = <0xfefff7ff 0x0807ffff>;
@@ -993,7 +993,7 @@
 			};
 
 			timer: timer@1e782000 {
-				compatible = "aspeed,ast2400-timer";
+				compatible = "aspeed,ast2500-timer";
 				reg = <0x1e782000 0x90>;
 				// The moxart_timer driver registers only one
 				// interrupt and assumes it's for timer 1
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
