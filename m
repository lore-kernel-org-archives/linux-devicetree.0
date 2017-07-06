From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 2/5] ARM: dts: at91: sama5d2: add isc node
Date: Thu, 6 Jul 2017 11:35:26 +0300
Message-ID: <1499330129-29319-3-git-send-email-claudiu.beznea@microchip.com>
References: <1499330129-29319-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499330129-29319-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, sza@esh.hu
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cristian.birsan@microchip.com, ludovic.desroches@microchip.com, Songjun Wu <songjun.wu@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

From: Songjun Wu <songjun.wu@microchip.com>

Add isc node, it conflicts with pdmic and uart3.

Signed-off-by: Songjun Wu <songjun.wu@microchip.com>
[claudiu.beznea@microchip.com: place isc node after hlcdc node]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
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
