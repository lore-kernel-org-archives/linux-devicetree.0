From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: replace enable-sdio-wakeup with wakeup-source for BananaPi M1+
Date: Mon, 14 Nov 2016 15:44:10 +0000
Message-ID: <1479138250-17780-4-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Though the mmc core driver will continue to support the legacy
"enable-sdio-wakeup" property to enable SDIO as the wakeup source,
"wakeup-source" is the new standard binding.

This patch replaces the legacy "enable-sdio-wakeup" with the unified
"wakeup-source" property in order to avoid any further copy-paste
duplication.

Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

Inspite of getting rid of most of the legacy property almost a year ago,
addition of new platforms have brought this back and over time it's
now found again in few places. Just get rid of them *again*

Regards,
Sudeep

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index ba5bca0fe997..1df47aa0a07b 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -167,7 +167,7 @@
 	mmc-pwrseq = <&mmc3_pwrseq>;
 	bus-width = <4>;
 	non-removable;
-	enable-sdio-wakeup;
+	wakeup-source;
 	status = "okay";

 	brcmf: bcrmf@1 {
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
