Return-Path: <SRS0=kKXI=DL=macbookpro.malat.net=mathieu@kernel.org>
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 06/25] arm: integrator: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 12:15:56 +0100
Message-Id: <20171215111620.20379-6-malat@debian.org>
In-Reply-To: <20171215111620.20379-1-malat@debian.org>
References: <20171214165350.27850-1-malat@debian.org>
 <20171215111620.20379-1-malat@debian.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Jon Mason <jonmason@broadcom.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Barry Song <baohua@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
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
 arch/arm/boot/dts/integratorap.dts | 14 +++++++-------
 arch/arm/boot/dts/integratorcp.dts | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index 94d2ff9836d0..9efc753acb6d 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -56,7 +56,7 @@
 	};
 
 	/* 24 MHz chrystal on the Integrator/AP development board */
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: xtal24mhz@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -71,7 +71,7 @@
 	};
 
 	/* The UART clock is 14.74 MHz divided by an ICS525 */
-	uartclk: uartclk@14.74M {
+	uartclk: uartclk@14.74m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <14745600>;
@@ -80,14 +80,14 @@
 
 	core-module@10000000 {
 		/* 24 MHz chrystal on the core module */
-		cm24mhz: cm24mhz@24M {
+		cm24mhz: cm24mhz@24m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmosc: cmosc@24M {
+		cmosc: cmosc@24m {
 			compatible = "arm,syscon-icst525-integratorap-cm";
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
@@ -96,7 +96,7 @@
 		};
 
 		/* Auxilary oscillator on the core module, 32.369MHz at boot */
-		auxosc: auxosc@24M {
+		auxosc: auxosc@24m {
 			compatible = "arm,syscon-icst525";
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
@@ -116,7 +116,7 @@
 		 * SYSCLK clocks PCIv3 bridge, system controller and the
 		 * logic modules.
 		 */
-		sysclk: apsys@24M {
+		sysclk: apsys@24m {
 			compatible = "arm,syscon-icst525-integratorap-sys";
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
@@ -125,7 +125,7 @@
 		};
 
 		/* One-bit control for the PCI bus clock (33 or 25 MHz) */
-		pciclk: pciclk@24M {
+		pciclk: pciclk@24m {
 			compatible = "arm,syscon-icst525-integratorap-pci";
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/integratorcp.dts b/arch/arm/boot/dts/integratorcp.dts
index a185ab8759fa..76c41a04e8a0 100644
--- a/arch/arm/boot/dts/integratorcp.dts
+++ b/arch/arm/boot/dts/integratorcp.dts
@@ -47,14 +47,14 @@
 	 */
 
 	/* The codec chrystal operates at 24.576 MHz */
-	xtal_codec: xtal24.576@24.576M {
+	xtal_codec: xtal24.576@24.576m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24576000>;
 	};
 
 	/* The chrystal is divided by 2 by the codec for the AACI bit clock */
-	aaci_bitclk: aaci_bitclk@12.288M {
+	aaci_bitclk: aaci_bitclk@12.288m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <2>;
@@ -63,14 +63,14 @@
 	};
 
 	/* This is a 25MHz chrystal on the base board */
-	xtal25mhz: xtal25mhz@25M {
+	xtal25mhz: xtal25mhz@25m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <25000000>;
 	};
 
 	/* The UART clock is 14.74 MHz divided from 25MHz by an ICS525 */
-	uartclk: uartclk@14.74M {
+	uartclk: uartclk@14.74m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <14745600>;
@@ -85,14 +85,14 @@
 
 	core-module@10000000 {
 		/* 24 MHz chrystal on the core module */
-		cm24mhz: cm24mhz@24M {
+		cm24mhz: cm24mhz@24m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmcore: cmosc@24M {
+		cmcore: cmosc@24m {
 			compatible = "arm,syscon-icst525-integratorcp-cm-core";
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
@@ -101,7 +101,7 @@
 		};
 
 		/* Oscillator on the core module, clocks the memory bus */
-		cmmem: cmosc@24M {
+		cmmem: cmosc@24m {
 			compatible = "arm,syscon-icst525-integratorcp-cm-mem";
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
@@ -110,7 +110,7 @@
 		};
 
 		/* Auxilary oscillator on the core module, clocks the CLCD */
-		auxosc: auxosc@24M {
+		auxosc: auxosc@24m {
 			compatible = "arm,syscon-icst525";
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
@@ -119,7 +119,7 @@
 		};
 
 		/* The KMI clock is the 24 MHz oscillator divided to 8MHz */
-		kmiclk: kmiclk@1M {
+		kmiclk: kmiclk@1m {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <3>;
@@ -128,7 +128,7 @@
 		};
 
 		/* The timer clock is the 24 MHz oscillator divided to 1MHz */
-		timclk: timclk@1M {
+		timclk: timclk@1m {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <24>;
-- 
2.11.0
