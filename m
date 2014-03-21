From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/20] ARM: nomadik: Convert to the common mmc DT bindings for highspeed mode
Date: Fri, 21 Mar 2014 13:14:06 +0100
Message-ID: <1395404057-27835-10-git-send-email-ulf.hansson@linaro.org>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mmci host driver supports the common mmc DT parser, which enables
us to use the use common names instead.

Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>
Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index 5acc044..d316c95 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -840,8 +840,8 @@
 			interrupts = <22>;
 			max-frequency = <48000000>;
 			bus-width = <4>;
-			mmc-cap-mmc-highspeed;
-			mmc-cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sd-highspeed;
 			cd-gpios = <&gpio3 15 0x1>;
 			cd-inverted;
 			pinctrl-names = "default";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
