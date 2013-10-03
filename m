From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/10] ARM: ux500: fix proximity sensor button
Date: Thu,  3 Oct 2013 13:30:17 +0200
Message-ID: <1380799817-25852-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The proximity sensor is connected to pin AH12 on newer HREFs,
that corresponds to pin offset 25 on gpio5, not gpio6.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-hrefv60plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ste-hrefv60plus.dts b/arch/arm/boot/dts/ste-hrefv60plus.dts
index bb3cfc7..1115468 100644
--- a/arch/arm/boot/dts/ste-hrefv60plus.dts
+++ b/arch/arm/boot/dts/ste-hrefv60plus.dts
@@ -20,7 +20,7 @@
 
 	gpio_keys {
 		button@1 {
-			gpios = <&gpio6 25 0x4>;
+			gpios = <&gpio5 25 0x4>;
 		};
 	};
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
