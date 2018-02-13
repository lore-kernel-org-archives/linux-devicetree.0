From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/9] ARM: dts: kzm9d: Fix "debounce-interval" property misspelling
Date: Tue, 13 Feb 2018 15:15:29 +0100
Message-ID: <1518531335-5170-4-git-send-email-geert+renesas@glider.be>
References: <1518531335-5170-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518531335-5170-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"debounce_interval" was never supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Please apply to your tree when appropriate.

 arch/arm/boot/dts/emev2-kzm9d.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index 60d0a732833aaada..c238407133bfe2d7 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -38,28 +38,28 @@
 		#size-cells = <0>;
 
 		one {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			label = "DSW2-1";
 			linux,code = <KEY_1>;
 			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
 		};
 		two {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			label = "DSW2-2";
 			linux,code = <KEY_2>;
 			gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
 		};
 		three {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			label = "DSW2-3";
 			linux,code = <KEY_3>;
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 		};
 		four {
-			debounce_interval = <50>;
+			debounce-interval = <50>;
 			wakeup-source;
 			label = "DSW2-4";
 			linux,code = <KEY_4>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
