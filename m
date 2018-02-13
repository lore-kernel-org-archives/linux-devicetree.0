From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 8/9] ARM: dts: Ux500: Fix "debounce-interval" property misspelling
Date: Tue, 13 Feb 2018 15:15:34 +0100
Message-ID: <1518531335-5170-9-git-send-email-geert+renesas@glider.be>
References: <1518531335-5170-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518531335-5170-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"debounce_interval" was never supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Please apply to your tree when appropriate.

 arch/arm/boot/dts/ste-snowball.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index ade1d0d4e5f45c59..b0b94d05309855f4 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -46,35 +46,35 @@
 		#size-cells = <0>;
 
 		button@1 {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <2>;
 			label = "userpb";
 			gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		};
 		button@2 {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <3>;
 			label = "extkb1";
 			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
 		};
 		button@3 {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <4>;
 			label = "extkb2";
 			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
 		};
 		button@4 {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <5>;
 			label = "extkb3";
 			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		};
 		button@5 {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <6>;
 			label = "extkb4";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
