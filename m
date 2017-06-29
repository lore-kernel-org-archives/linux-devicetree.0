From: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 2/5] ARM: dts: at91: sama5d2: add isc node
Date: Thu, 29 Jun 2017 14:44:31 +0300
Message-ID: <1498736674-9233-3-git-send-email-claudiu.beznea@microchip.com>
References: <1498736674-9233-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498736674-9233-1-git-send-email-claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sza-4N5lU0Zj96A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Add isc node, it conflicts with pdmic and uart3.

Signed-off-by: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
[claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org: place isc node after hlcdc node]
Signed-off-by: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/sama5d2.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 71e9d83..9d13b55 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -416,6 +416,17 @@
 				};
 			};
 
+			isc: isc@f0008000 {
+				compatible = "atmel,sama5d2-isc";
+				reg = <0xf0008000 0x4000>;
+				interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
+				clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
+				clock-names = "hclock", "iscck", "gck";
+				#clock-cells = <0>;
+				clock-output-names = "isc-mck";
+				status = "disabled";
+			};
+
 			ramc0: ramc@f000c000 {
 				compatible = "atmel,sama5d3-ddramc";
 				reg = <0xf000c000 0x200>;
@@ -925,6 +936,11 @@
 						atmel,clk-output-range = <0 83000000>;
 					};
 
+					isc_gclk: isc_gclk {
+						#clock-cells = <0>;
+						reg = <46>;
+					};
+
 					pdmic_gclk: pdmic_gclk {
 						#clock-cells = <0>;
 						reg = <48>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
