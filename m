From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 1/5] ARM: dts: lpc32xx: change hexadecimal values to lower case
Date: Fri, 19 Apr 2019 23:54:43 +0300
Message-ID: <20190419205447.6357-2-vz@mleia.com>
References: <20190419205447.6357-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190419205447.6357-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
List-Id: devicetree@vger.kernel.org

This is a non-functional change, all inconsistent hexadecimal values
found in the file are now fixed.

Taking a chance to interfere into some non-functional change I add
my copyright notice for work done during the last few years.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 20b38f4ade37..5eb223dffbe7 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -1,6 +1,7 @@
 /*
  * NXP LPC32xx SoC
  *
+ * Copyright (C) 2015-2019 Vladimir Zapolskiy <vz@mleia.com>
  * Copyright 2012 Roland Stigge <stigge@antcom.de>
  *
  * The code contained herein is licensed under the GNU General Public
@@ -232,7 +233,7 @@
 
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
-				reg = <0x2009C000 0x1000>;
+				reg = <0x2009c000 0x1000>;
 			};
 
 			/* UART5 first since it is the default console, ttyS0 */
@@ -275,7 +276,7 @@
 
 			i2c1: i2c@400a0000 {
 				compatible = "nxp,pnx-i2c";
-				reg = <0x400A0000 0x100>;
+				reg = <0x400a0000 0x100>;
 				interrupt-parent = <&sic1>;
 				interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 				#address-cells = <1>;
@@ -286,7 +287,7 @@
 
 			i2c2: i2c@400a8000 {
 				compatible = "nxp,pnx-i2c";
-				reg = <0x400A8000 0x100>;
+				reg = <0x400a8000 0x100>;
 				interrupt-parent = <&sic1>;
 				interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
 				#address-cells = <1>;
@@ -297,7 +298,7 @@
 
 			mpwm: mpwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
-				reg = <0x400E8000 0x78>;
+				reg = <0x400e8000 0x78>;
 				status = "disabled";
 				#pwm-cells = <2>;
 			};
@@ -396,7 +397,7 @@
 
 			timer4: timer@4002c000 {
 				compatible = "nxp,lpc3220-timer";
-				reg = <0x4002C000 0x1000>;
+				reg = <0x4002c000 0x1000>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 				clocks = <&clk LPC32XX_CLK_TIMER4>;
 				clock-names = "timerclk";
@@ -414,7 +415,7 @@
 
 			watchdog: watchdog@4003c000 {
 				compatible = "nxp,pnx4008-wdt";
-				reg = <0x4003C000 0x1000>;
+				reg = <0x4003c000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_WDOG>;
 			};
 
@@ -453,7 +454,7 @@
 
 			timer1: timer@4004c000 {
 				compatible = "nxp,lpc3220-timer";
-				reg = <0x4004C000 0x1000>;
+				reg = <0x4004c000 0x1000>;
 				interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 				clocks = <&clk LPC32XX_CLK_TIMER1>;
 				clock-names = "timerclk";
@@ -479,7 +480,7 @@
 
 			pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
-				reg = <0x4005C000 0x4>;
+				reg = <0x4005c000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
@@ -488,7 +489,7 @@
 
 			pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
-				reg = <0x4005C004 0x4>;
+				reg = <0x4005c004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
-- 
2.20.1
