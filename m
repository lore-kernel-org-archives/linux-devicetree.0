From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v3 3/4] ARM: dts: at91: sama5d2: add ADC hw trigger
Date: Thu, 25 May 2017 14:17:13 +0300
Message-ID: <1495711034-28410-4-git-send-email-eugen.hristev@microchip.com>
References: <1495711034-28410-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495711034-28410-1-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add ADTRG hardware pin possible edge types as nodes
and default edge as property to the ADC

Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/sama5d2.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 8067c71..a06ca8d 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -1267,7 +1267,18 @@
 				atmel,min-sample-rate-hz = <200000>;
 				atmel,max-sample-rate-hz = <20000000>;
 				atmel,startup-time-ms = <4>;
+				atmel,trigger-edge-type = <&external_rising>;
 				status = "disabled";
+
+				/* possible edge type for ADTRG trigger pin */
+				adtrg: adtrg {
+					external_rising: external_rising {
+					};
+					external_falling: external_falling {
+					};
+					external_any: external_any {
+					};
+				};
 			};
 
 			pioA: pinctrl@fc038000 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
