From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 21/25] arm: realview: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 13:46:54 +0100
Message-ID: <20171215124655.30952-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

Reported-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi    | 32 +++++++++++++++----------------
 arch/arm/boot/dts/arm-realview-pb1176.dts | 30 ++++++++++++++---------------
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 32 +++++++++++++++----------------
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 32 +++++++++++++++----------------
 4 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index e2e9599596e2..bc07a1755073 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -51,13 +51,13 @@
 		regulator-boot-on;
         };
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: xtal24mhz@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
 	};
 
-	timclk: timclk@1M {
+	timclk: timclk@1m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <24>;
@@ -65,7 +65,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
+	mclk: mclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -73,7 +73,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	kmiclk: kmiclk@24M {
+	kmiclk: kmiclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -81,7 +81,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	sspclk: sspclk@24M {
+	sspclk: sspclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -89,7 +89,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	uartclk: uartclk@24M {
+	uartclk: uartclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -97,7 +97,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	wdogclk: wdogclk@24M {
+	wdogclk: wdogclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -154,7 +154,7 @@
 			compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -162,7 +162,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -170,7 +170,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -178,42 +178,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index c789564f2803..658b27ba002b 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -61,13 +61,13 @@
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: xtal24mhz@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
 	};
 
-	timclk: timclk@1M {
+	timclk: timclk@1m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <24>;
@@ -75,7 +75,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
+	mclk: mclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -83,7 +83,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	kmiclk: kmiclk@24M {
+	kmiclk: kmiclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -91,7 +91,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	sspclk: sspclk@24M {
+	sspclk: sspclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -99,7 +99,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	uartclk: uartclk@24M {
+	uartclk: uartclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -172,7 +172,7 @@
 			compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -180,7 +180,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -188,7 +188,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -196,42 +196,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 3944765ac4b0..312b4ff5f2ea 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -161,7 +161,7 @@
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: xtal24mhz@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -173,7 +173,7 @@
 		clock-frequency = <32768>;
 	};
 
-	timclk: timclk@1M {
+	timclk: timclk@1m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <24>;
@@ -181,7 +181,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
+	mclk: mclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -189,7 +189,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	kmiclk: kmiclk@24M {
+	kmiclk: kmiclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -197,7 +197,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	sspclk: sspclk@24M {
+	sspclk: sspclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -205,7 +205,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	uartclk: uartclk@24M {
+	uartclk: uartclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -213,7 +213,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	wdogclk: wdogclk@24M {
+	wdogclk: wdogclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -253,7 +253,7 @@
 			compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -261,7 +261,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -269,7 +269,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -277,7 +277,7 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
@@ -285,7 +285,7 @@
 				linux,default-trigger = "cpu1";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
@@ -293,7 +293,7 @@
 				linux,default-trigger = "cpu2";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
@@ -301,14 +301,14 @@
 				linux,default-trigger = "cpu3";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
@@ -316,7 +316,7 @@
 				default-state = "off";
 			};
 
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index aeb49c4bd773..86c9eb94b5ad 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -59,7 +59,7 @@
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: xtal24mhz@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -71,7 +71,7 @@
 		clock-frequency = <32768>;
 	};
 
-	timclk: timclk@1M {
+	timclk: timclk@1m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <24>;
@@ -79,7 +79,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
+	mclk: mclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -87,7 +87,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	kmiclk: kmiclk@24M {
+	kmiclk: kmiclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -95,7 +95,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	sspclk: sspclk@24M {
+	sspclk: sspclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -103,7 +103,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	uartclk: uartclk@24M {
+	uartclk: uartclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -111,7 +111,7 @@
 		clocks = <&xtal24mhz>;
 	};
 
-	wdogclk: wdogclk@24M {
+	wdogclk: wdogclk@24m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
 		clock-div = <1>;
@@ -169,7 +169,7 @@
 			compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -177,7 +177,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -185,7 +185,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -193,42 +193,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
