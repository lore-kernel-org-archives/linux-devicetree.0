From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from the downstream tree.
Date: Wed,  7 Sep 2016 12:31:25 +0200
Message-ID: <1473244289-20728-5-git-send-email-kraxel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473244289-20728-1-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

This will be used for having EMMC (sdhci-bcm2835.c) drive the
wireless.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 062d09db..b6b1950 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -257,6 +257,11 @@
 				brcm,pins = <32 33>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
 			};
+			emmc_gpio34: emmc_gpio34 {
+				brcm,pins = <34 35 36 37 38 39>;
+				brcm,function = <BCM2835_FSEL_ALT3>;
+				brcm,pull = <0 2 2 2 2 2>;
+			};
 			emmc_gpio48: emmc_gpio48 {
 				brcm,pins = <48 49 50 51 52 53>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
