From: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v2 07/14] ARM: dts: at91: sama5d27_som1_ek: remove not connected CAN0
Date: Tue, 10 Oct 2017 13:09:42 +0300
Message-ID: <1507630189-15504-8-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

CAN0 is not connected on the sama5d27_som1_ek board, so remove
it from DT.

Signed-off-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
[claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org: change subject to match the desired prefix]
Signed-off-by: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index 339f4e71cf40..651ed5d4defc 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -175,12 +175,6 @@
 				status = "okay";
 			};
 
-			can0: can@f8054000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_can0_default>;
-				status = "disabled"; /* Conflict with isc. */
-			};
-
 			uart3: serial@fc008000 {
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
@@ -279,12 +273,6 @@
 
 			pinctrl@fc038000 {
 
-				pinctrl_can0_default: can0_default {
-					pinmux = <PIN_PC10__CANTX0>,
-						 <PIN_PC11__CANRX0>;
-					bias-disable;
-				};
-
 				pinctrl_can1_default: can1_default {
 					pinmux = <PIN_PC26__CANTX1>,
 						 <PIN_PC27__CANRX1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
