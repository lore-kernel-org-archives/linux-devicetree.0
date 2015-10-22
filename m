From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] leds: aat1290: Fix property naming of flash-timeout-us
Date: Thu, 22 Oct 2015 10:14:06 +0900
Message-ID: <1445476447-11355-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

flash-timeout-us property name is changed to flash-max-timeout-us.
This patch fixes that name

Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/leds-aat1290.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
index c05ed91..85c0c58 100644
--- a/Documentation/devicetree/bindings/leds/leds-aat1290.txt
+++ b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
@@ -27,9 +27,9 @@ Required properties of the LED child node:
 - flash-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
                        Maximum flash LED supply current can be calculated using
                        following formula: I = 1A * 162kohm / Rset.
-- flash-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
-                     Maximum flash timeout can be calculated using following
-                     formula: T = 8.82 * 10^9 * Ct.
+- flash-max-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
+                         Maximum flash timeout can be calculated using following
+                         formula: T = 8.82 * 10^9 * Ct.
 
 Optional properties of the LED child node:
 - label : see Documentation/devicetree/bindings/leds/common.txt
@@ -54,7 +54,7 @@ aat1290 {
 		label = "aat1290-flash";
 		led-max-microamp = <520833>;
 		flash-max-microamp = <1012500>;
-		flash-timeout-us = <1940000>;
+		flash-max-timeout-us = <1940000>;
 	};
 };
 
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
