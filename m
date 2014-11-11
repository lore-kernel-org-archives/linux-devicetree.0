From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 1/1] ARM: dts: sunxi: Banana Pi: increase startup-delay for the GMAC PHY regulator
Date: Wed, 12 Nov 2014 00:01:46 +0100
Message-ID: <1415746906-20835-2-git-send-email-merker@debian.org>
References: <1415539714-7652-1-git-send-email-merker@debian.org>
 <1415746906-20835-1-git-send-email-merker@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415746906-20835-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On the LeMaker Banana Pi, probing the external ethernet PHY connected
to the SoC's internal GMAC module sometimes fails. The PHY power
supply is handled via a GPIO-controlled regulator, and the existing
regulator startup-delay of 50000us is too short to make sure that the
PHY is always fully powered up when it is queried by phylib. Tests
have shown that to provide a reliable PHY detection, the startup-delay
has to be increased to at least 60000us. To have a certain safety margin
and to cater for manufacturing variations between different boards,
the delay gets set to 100000us as discussed on the linux-arm-kernel
mailinglist.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 3de847d..1cf1214 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -207,7 +207,7 @@
 		regulator-name = "gmac-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <50000>;
+		startup-delay-us = <100000>;
 		enable-active-high;
 		gpio = <&pio 7 23 0>;
 	};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
