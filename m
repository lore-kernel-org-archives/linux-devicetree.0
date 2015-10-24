From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: sunxi: sun6i-a31s-primo81.dts: add touchscreen axis swapping property
Date: Sat, 24 Oct 2015 23:07:31 +0200
Message-ID: <1445720851-2148-1-git-send-email-merker@debian.org>
References: <20151024205716.GA16644@excalibur.cnev.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151024205716.GA16644-Hlt6eto4P0pdWf7zwHaZWbNAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The MSI Primo81 has a display in portrait mode but a touchscreen
in landscape mode.  To have both of them use the same coordinate
system, the touchscreen-swapped-x-y property has to be set
for the touchscreen.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31s-primo81.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
index 2d4250b..68b479b 100644
--- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
@@ -83,6 +83,7 @@
 		reg = <0x5d>;
 		interrupt-parent = <&pio>;
 		interrupts = <0 3 IRQ_TYPE_LEVEL_HIGH>; /* PA3 */
+		touchscreen-swapped-x-y;
 	};
 };
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
