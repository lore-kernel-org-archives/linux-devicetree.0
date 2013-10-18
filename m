From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] ARM: ux500: fix clock for GPIO blocks 6 and 7
Date: Fri, 18 Oct 2013 11:05:12 +0200
Message-ID: <1382087112-31665-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock assignment in the device tree for GPIO blocks 6
and 7 was incorrect, indicating this was managed by bit 1 on
PRCC 2 while it was in fact bit 11 on PRCC 2.

Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index 55abf12..5112f4c 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -197,7 +197,7 @@
 			#gpio-cells = <2>;
 			gpio-bank = <6>;
 
-			clocks = <&prcc_pclk 2 1>;
+			clocks = <&prcc_pclk 2 11>;
 		};
 
 		gpio7: gpio@8011e080 {
@@ -212,7 +212,7 @@
 			#gpio-cells = <2>;
 			gpio-bank = <7>;
 
-			clocks = <&prcc_pclk 2 1>;
+			clocks = <&prcc_pclk 2 11>;
 		};
 
 		gpio8: gpio@a03fe000 {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
