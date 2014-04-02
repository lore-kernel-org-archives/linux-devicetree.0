From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: [PATCH v2 1/2] ARM: dts: mx5: fix wrong stmpe-ts bindings
Date: Wed,  2 Apr 2014 19:05:37 +0200
Message-ID: <94a8b96fe30ce97ec89e49ef6470271888024256.1396457876.git.stefan@agner.ch>
References: <cover.1396457876.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1396457876.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Fix bindings for STMPE touchscreen controller to match the documented
bindings and the actual bindings used by the driver.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 arch/arm/boot/dts/imx53-m53evk.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-m53evk.dts b/arch/arm/boot/dts/imx53-m53evk.dts
index 7d304d0..e97f298 100644
--- a/arch/arm/boot/dts/imx53-m53evk.dts
+++ b/arch/arm/boot/dts/imx53-m53evk.dts
@@ -165,17 +165,17 @@
 		irq-trigger = <0x1>;
 
 		stmpe_touchscreen {
-			compatible = "stmpe,ts";
+			compatible = "st,stmpe-ts";
 			reg = <0>;
-			ts,sample-time = <4>;
-			ts,mod-12b = <1>;
-			ts,ref-sel = <0>;
-			ts,adc-freq = <1>;
-			ts,ave-ctrl = <3>;
-			ts,touch-det-delay = <3>;
-			ts,settling = <4>;
-			ts,fraction-z = <7>;
-			ts,i-drive = <1>;
+			st,sample-time = <4>;
+			st,mod-12b = <1>;
+			st,ref-sel = <0>;
+			st,adc-freq = <1>;
+			st,ave-ctrl = <3>;
+			st,touch-det-delay = <3>;
+			st,settling = <4>;
+			st,fraction-z = <7>;
+			st,i-drive = <1>;
 		};
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
