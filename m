From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: atlas7: Use generic uart-has-rtscts DT property
Date: Tue, 31 May 2016 16:31:52 +0200
Message-ID: <1464705112-21609-4-git-send-email-geert+renesas@glider.be>
References: <1464705112-21609-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464705112-21609-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As of commit 7f60830ab1511d94 ("serial: sirf: Use generic
uart-has-rtscts DT property property"), the SiRF UART driver recognizes
the generic "uart-has-rtscts" DT property, deprecating the
vendor-specific "sirf,uart-has-rtscts" DT property. Hence replace the
latter by the former in all DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/atlas7-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/atlas7-evb.dts b/arch/arm/boot/dts/atlas7-evb.dts
index 1e9cd1a8508e17c2..900e03b7a7b21011 100644
--- a/arch/arm/boot/dts/atlas7-evb.dts
+++ b/arch/arm/boot/dts/atlas7-evb.dts
@@ -73,7 +73,7 @@
 		btm {
 			uart6: uart@11000000 {
 				status = "okay";
-				sirf,uart-has-rtscts;
+				uart-has-rtscts;
 			};
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
