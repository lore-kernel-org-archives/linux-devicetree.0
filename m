Return-Path: <SRS0=rNTY=OO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:56508 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727592AbeLEXEt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Dec 2018 18:04:49 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Date: Wed,  5 Dec 2018 15:03:56 -0800
Message-Id: <20181205230356.38855-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

Earlier attempt to move am335x mcasp to probe with ti-sysc
interconnect target module caused audio to stop working and and
the dts changes were reverted by commit 5d2632a577ba ("ARM: dts:
Revert am335x mcasp ti-sysc changes").

Turns out we were missing the l3 data port ranges for mcasp. This
caused mcasp dma to attempt to use wrong port address. So let's
try again essentially reverting the earlier revert and adding the
missing l3 data port ranges.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Peter, can you please test with your bbb + audio cape?

---
 arch/arm/boot/dts/am33xx-l4.dtsi | 42 +++++++++++++++++++++++++++-----
 arch/arm/boot/dts/am33xx.dtsi    | 29 ----------------------
 2 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -824,7 +824,9 @@
 	ranges = <0x00000000 0x48000000 0x100000>,	/* segment 0 */
 		 <0x00100000 0x48100000 0x100000>,	/* segment 1 */
 		 <0x00200000 0x48200000 0x100000>,	/* segment 2 */
-		 <0x00300000 0x48300000 0x100000>;	/* segment 3 */
+		 <0x00300000 0x48300000 0x100000>,	/* segment 3 */
+		 <0x46000000 0x46000000 0x400000>,	/* l3 data port */
+		 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
 
 	segment@0 {					/* 0x48000000 */
 		compatible = "simple-bus";
@@ -881,7 +883,9 @@
 			 <0x000cc000 0x000cc000 0x001000>,	/* ap 89 */
 			 <0x000cd000 0x000cd000 0x001000>,	/* ap 90 */
 			 <0x000ca000 0x000ca000 0x001000>,	/* ap 91 */
-			 <0x000cb000 0x000cb000 0x001000>;	/* ap 92 */
+			 <0x000cb000 0x000cb000 0x001000>,	/* ap 92 */
+			 <0x46000000 0x46000000 0x400000>,	/* l3 data port */
+			 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
 
 		target-module@8000 {			/* 0x48008000, ap 6 10.0 */
 			compatible = "ti,sysc";
@@ -1055,8 +1059,21 @@
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x38000 0x2000>;
-			status = "disabled";
+			ranges = <0x0 0x38000 0x2000>,
+				 <0x46000000 0x46000000 0x400000>;
+
+			mcasp0: mcasp@0 {
+				compatible = "ti,am33xx-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x46000000 0x400000>;
+				reg-names = "mpu", "dat";
+				interrupts = <80>, <81>;
+				interrupt-names = "tx", "rx";
+				status = "disabled";
+				dmas = <&edma 8 2>,
+					<&edma 9 2>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@3c000 {			/* 0x4803c000, ap 20 32.0 */
@@ -1073,8 +1090,21 @@
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x3c000 0x2000>;
-			status = "disabled";
+			ranges = <0x0 0x3c000 0x2000>,
+				 <0x46400000 0x46400000 0x400000>;
+
+			mcasp1: mcasp@0 {
+				compatible = "ti,am33xx-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x46400000 0x400000>;
+				reg-names = "mpu", "dat";
+				interrupts = <82>, <83>;
+				interrupt-names = "tx", "rx";
+				status = "disabled";
+				dmas = <&edma 10 2>,
+					<&edma 11 2>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@40000 {			/* 0x48040000, ap 22 1e.0 */
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -440,36 +440,7 @@
 			       <&edma 5 0>;
 			dma-names = "tx", "rx";
 		};
-
-		mcasp0: mcasp@48038000 {
-			compatible = "ti,am33xx-mcasp-audio";
-			ti,hwmods = "mcasp0";
-			reg = <0x48038000 0x2000>,
-			      <0x46000000 0x400000>;
-			reg-names = "mpu", "dat";
-			interrupts = <80>, <81>;
-			interrupt-names = "tx", "rx";
-			status = "disabled";
-			dmas = <&edma 8 2>,
-				<&edma 9 2>;
-			dma-names = "tx", "rx";
-		};
-
-		mcasp1: mcasp@4803c000 {
-			compatible = "ti,am33xx-mcasp-audio";
-			ti,hwmods = "mcasp1";
-			reg = <0x4803C000 0x2000>,
-			      <0x46400000 0x400000>;
-			reg-names = "mpu", "dat";
-			interrupts = <82>, <83>;
-			interrupt-names = "tx", "rx";
-			status = "disabled";
-			dmas = <&edma 10 2>,
-				<&edma 11 2>;
-			dma-names = "tx", "rx";
-		};
 	};
-
 };
 
 #include "am33xx-l4.dtsi"
-- 
2.19.2
