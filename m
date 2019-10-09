From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/8] ARM: dts: at91: sama5d2: add TCB GCLK
Date: Thu, 10 Oct 2019 00:40:01 +0200
Message-ID: <20191009224006.5021-4-alexandre.belloni@bootlin.com>
References: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

The sama5d2 tcbs take an extra input clock, their gclk.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 2e2c1a7b1d1d..f878d7866970 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -495,23 +495,23 @@
 			};
 
 			tcb0: timer@f800c000 {
-				compatible = "atmel,at91sam9x5-tcb", "simple-mfd", "syscon";
+				compatible = "atmel,sama5d2-tcb", "simple-mfd", "syscon";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0xf800c000 0x100>;
 				interrupts = <35 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&clk32k>;
-				clock-names = "t0_clk", "slow_clk";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&pmc PMC_TYPE_GCK 35>, <&clk32k>;
+				clock-names = "t0_clk", "gclk", "slow_clk";
 			};
 
 			tcb1: timer@f8010000 {
-				compatible = "atmel,at91sam9x5-tcb", "simple-mfd", "syscon";
+				compatible = "atmel,sama5d2-tcb", "simple-mfd", "syscon";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0xf8010000 0x100>;
 				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>, <&clk32k>;
-				clock-names = "t0_clk", "slow_clk";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>, <&pmc PMC_TYPE_GCK 36>, <&clk32k>;
+				clock-names = "t0_clk", "gclk", "slow_clk";
 			};
 
 			hsmc: hsmc@f8014000 {
-- 
2.21.0
