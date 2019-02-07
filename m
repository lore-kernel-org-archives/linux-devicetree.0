From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH] ARM: dts: at91: sama5d2: add labels to soc dtsi for derivative boards
Date: Thu, 7 Feb 2019 11:15:47 +0100
Message-ID: <20190207101547.14602-1-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Cc: Eugen Hristev <eugen.hristev@microchip.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: devicetree@vger.kernel.org

This adds labels to commonly used device-tree nodes so that derivative
boards can avoid ahb/apb hierarchy.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index d159ee42ef29..9519b9d5abca 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -688,13 +688,13 @@
 				ranges = <0 0xf8044000 0x1420>;
 			};
 
-			rstc@f8048000 {
+			reset_controller: rstc@f8048000 {
 				compatible = "atmel,sama5d3-rstc";
 				reg = <0xf8048000 0x10>;
 				clocks = <&clk32k>;
 			};
 
-			shdwc@f8048010 {
+			shutdown_controller: shdwc@f8048010 {
 				compatible = "atmel,sama5d2-shdwc";
 				reg = <0xf8048010 0x10>;
 				clocks = <&clk32k>;
@@ -710,7 +710,7 @@
 				clocks = <&pmc PMC_TYPE_CORE PMC_MCK2>;
 			};
 
-			watchdog@f8048040 {
+			watchdog: watchdog@f8048040 {
 				compatible = "atmel,sama5d4-wdt";
 				reg = <0xf8048040 0x10>;
 				interrupts = <4 IRQ_TYPE_LEVEL_HIGH 7>;
-- 
2.17.1
