From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 08/25] arm: lpc32: dts: Remove leading 0x and 0s from bindings
 notation
Date: Fri, 15 Dec 2017 13:46:39 +0100
Message-ID: <20171215124639.30283-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This will solve as a side effect warning:

Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index abff7ef7c9cd..4981741377f3 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -230,7 +230,7 @@
 				status = "disabled";
 			};
 
-			i2s1: i2s@2009C000 {
+			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009C000 0x1000>;
 			};
@@ -273,7 +273,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@400A0000 {
+			i2c1: i2c@400a0000 {
 				compatible = "nxp,pnx-i2c";
 				reg = <0x400A0000 0x100>;
 				interrupt-parent = <&sic1>;
@@ -284,7 +284,7 @@
 				clocks = <&clk LPC32XX_CLK_I2C1>;
 			};
 
-			i2c2: i2c@400A8000 {
+			i2c2: i2c@400a8000 {
 				compatible = "nxp,pnx-i2c";
 				reg = <0x400A8000 0x100>;
 				interrupt-parent = <&sic1>;
@@ -295,7 +295,7 @@
 				clocks = <&clk LPC32XX_CLK_I2C2>;
 			};
 
-			mpwm: mpwm@400E8000 {
+			mpwm: mpwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
 				reg = <0x400E8000 0x78>;
 				status = "disabled";
@@ -394,7 +394,7 @@
 				#gpio-cells = <3>; /* bank, pin, flags */
 			};
 
-			timer4: timer@4002C000 {
+			timer4: timer@4002c000 {
 				compatible = "nxp,lpc3220-timer";
 				reg = <0x4002C000 0x1000>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -412,7 +412,7 @@
 				status = "disabled";
 			};
 
-			watchdog: watchdog@4003C000 {
+			watchdog: watchdog@4003c000 {
 				compatible = "nxp,pnx4008-wdt";
 				reg = <0x4003C000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_WDOG>;
@@ -451,7 +451,7 @@
 				status = "disabled";
 			};
 
-			timer1: timer@4004C000 {
+			timer1: timer@4004c000 {
 				compatible = "nxp,lpc3220-timer";
 				reg = <0x4004C000 0x1000>;
 				interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
@@ -475,7 +475,7 @@
 				status = "disabled";
 			};
 
-			pwm1: pwm@4005C000 {
+			pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005C000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
@@ -484,7 +484,7 @@
 				status = "disabled";
 			};
 
-			pwm2: pwm@4005C004 {
+			pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005C004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
-- 
2.11.0
