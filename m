From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v5 2/4] Documentation: dt: iio: at91-sama5d2_adc: add hw trigger edge binding
Date: Thu, 15 Jun 2017 16:24:55 +0300
Message-ID: <1497533097-12052-3-git-send-email-eugen.hristev@microchip.com>
References: <1497533097-12052-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497533097-12052-1-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add property for the edge type of the hardware trigger pin ADTRG

Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
  Changes in v4:
 - Modified bindings to be similar with interrupts

 Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
index 3223684..552e7a8 100644
--- a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
@@ -11,6 +11,11 @@ Required properties:
   - atmel,min-sample-rate-hz: Minimum sampling rate, it depends on SoC.
   - atmel,max-sample-rate-hz: Maximum sampling rate, it depends on SoC.
   - atmel,startup-time-ms: Startup time expressed in ms, it depends on SoC.
+  - atmel,trigger-edge-type: One of possible edge types for the ADTRG hardware
+  trigger pin. When the specific edge type is detected, the conversion will
+  start. Possible values are rising, falling, or both.
+  This property uses the IRQ edge types values: IRQ_TYPE_EDGE_RISING ,
+  IRQ_TYPE_EDGE_FALLING or IRQ_TYPE_EDGE_BOTH
 
 Example:
 
@@ -25,4 +30,5 @@ adc: adc@fc030000 {
 	atmel,startup-time-ms = <4>;
 	vddana-supply = <&vdd_3v3_lp_reg>;
 	vref-supply = <&vdd_3v3_lp_reg>;
+	atmel,trigger-edge-type = <IRQ_TYPE_EDGE_BOTH>;
 }
-- 
2.7.4
