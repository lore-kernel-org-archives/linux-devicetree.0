Return-Path: <SRS0=kKXI=DL=macbookpro.malat.net=mathieu@kernel.org>
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 08/25] arm: lpc32: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 12:15:58 +0100
Message-Id: <20171215111620.20379-8-malat@debian.org>
In-Reply-To: <20171215111620.20379-1-malat@debian.org>
References: <20171214165350.27850-1-malat@debian.org>
 <20171215111620.20379-1-malat@debian.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Barry Song <baohua@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

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
