From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH] leds: aat1290: Fix property naming of flash-timeout-us
Date: Thu, 22 Oct 2015 10:14:07 +0900
Message-ID: <1445476447-11355-2-git-send-email-ingi2.kim@samsung.com>
References: <1445476447-11355-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445476447-11355-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: j.anaszewski@samsung.com, kyungmin.park@samsung.com, sakari.ailus@linux.intel.com, cooloney@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: devicetree@vger.kernel.org

flash-timeout-us property name is changed to flash-max-timeout-us.
This patch fixes that name

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
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
