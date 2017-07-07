From: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH] ARM: dts: at91: sama5d2: fix EBI/NAND controllers declaration
Date: Fri, 7 Jul 2017 15:33:10 +0200
Message-ID: <20170707133310.10060-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix HSMC interrupt ID, PMECC registers and EBI ones.

Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/sama5d2.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index cc06da394366..4fcd5bb219e3 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -303,7 +303,7 @@
 			#size-cells = <1>;
 			atmel,smc = <&hsmc>;
 			reg = <0x10000000 0x10000000
-			       0x40000000 0x30000000>;
+			       0x60000000 0x30000000>;
 			ranges = <0x0 0x0 0x10000000 0x10000000
 				  0x1 0x0 0x60000000 0x10000000
 				  0x2 0x0 0x70000000 0x10000000
@@ -1050,16 +1050,16 @@
 			hsmc: hsmc@f8014000 {
 				compatible = "atmel,sama5d3-smc", "syscon", "simple-mfd";
 				reg = <0xf8014000 0x1000>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 6>;
+				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 6>;
 				clocks = <&hsmc_clk>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges;
 
-				pmecc: ecc-engine@ffffc070 {
+				pmecc: ecc-engine@f8014070 {
 					compatible = "atmel,sama5d2-pmecc";
-					reg = <0xffffc070 0x490>,
-					      <0xffffc500 0x100>;
+					reg = <0xf8014070 0x490>,
+					      <0xf8014500 0x100>;
 				};
 			};
 
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
