From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: at91/dt: sama5d3 xplained: don't disable hsmci regulator
Date: Fri, 11 Mar 2016 11:43:39 +0100
Message-ID: <1457693033-3619-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If enabling the hsmci regulator on card detection, the board can reboot
on sd card insertion. Keeping the regulator always enabled fixes this
issue.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Fixes: 1b53e3416dd0 ("ARM: at91/dt: sama5d3 xplained: add fixed
regulator for vmmc0")
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org #4.3 and later
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index d81474e..d4f5987 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -303,6 +303,7 @@
 		regulator-name = "mmc0-card-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 
 	gpio_keys {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
