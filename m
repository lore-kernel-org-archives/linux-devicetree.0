From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 7/7] Documentation: devicetree: loosen primecell clock requirements
Date: Tue, 11 Feb 2014 11:37:12 +0000
Message-ID: <1392118632-11312-8-git-send-email-mark.rutland@arm.com>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392118632-11312-1-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The primecell binding requires the APB PCLK (named "apb_pclk") to be the
first entry in the clocks list, yet existing drivers and dts files
expect other clocks first, in clear violation of this requirement.
Additionally, the code handling the apb_pclk always acquires the clock
by name rather than index, making the requirement irrelevant.

As there are no other implementations handling the primecell bindings,
this patch loosens the requirements to an apb_pclk entry existing in the
clocks list. This is compatible with existing software, and any new
software handling the weaker requirements will be able to use existing
dts. Any software relying on the original stricter requirements will be
unable to use many existing dts, so the loosened requirement aids
compatibility rather than hindering it.

Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/primecell.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/primecell.txt b/Documentation/devicetree/bindings/arm/primecell.txt
index 0df6aca..0a66506 100644
--- a/Documentation/devicetree/bindings/arm/primecell.txt
+++ b/Documentation/devicetree/bindings/arm/primecell.txt
@@ -13,9 +13,10 @@ Required properties:
 Optional properties:
 
 - arm,primecell-periphid : Value to override the h/w value with
-- clocks : From common clock binding. First clock is phandle to clock for apb
-	pclk. Additional clocks are optional and specific to those peripherals.
-- clock-names : From common clock binding. Shall be "apb_pclk" for first clock.
+- clocks : From common clock binding. One clock must be the apb pclk.
+           Additional clocks are optional and specific to those peripherals.
+- clock-names : From common clock binding. Shall include "apb_pclk" for the apb
+                pclk.
 - dmas : From common DMA binding. If present, refers to one or more dma channels.
 - dma-names : From common DMA binding, needs to match the 'dmas' property.
               Devices with exactly one receive and transmit channel shall name
@@ -31,8 +32,8 @@ serial@fff36000 {
 	compatible = "arm,pl011", "arm,primecell";
 	arm,primecell-periphid = <0x00341011>;
 
-	clocks = <&pclk>;
-	clock-names = "apb_pclk";
+	clocks = <&refclk>, <&pclk>;
+	clock-names = "uartclk", "apb_pclk";
 
 	dmas = <&dma-controller 4>, <&dma-controller 5>;
 	dma-names = "rx", "tx";	
-- 
1.8.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
