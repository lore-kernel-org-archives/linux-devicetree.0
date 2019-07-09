From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 4/5] staging: mt7621-dts: add dt nodes for mt7621-pll
Date: Wed, 10 Jul 2019 02:20:17 +0800
Message-ID: <20190709182018.23193-5-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709182018.23193-1-gch981213@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit adds device-tree node for mt7621-pll and use its clock
accordingly.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index a4c08110094b..12717f570ceb 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,4 +1,5 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
+#include <dt-bindings/clock/mt7621-clk.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -27,12 +28,11 @@
 		serial0 = &uartlite;
 	};
 
-	cpuclock: cpuclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
+	pll: pll {
+		compatible = "mediatek,mt7621-pll", "syscon";
 
-		/* FIXME: there should be way to detect this */
-		clock-frequency = <880000000>;
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "bus";
 	};
 
 	sysclock: sysclock@0 {
@@ -155,7 +155,6 @@
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
 
-			clocks = <&sysclock>;
 			clock-frequency = <50000000>;
 
 			interrupt-parent = <&gic>;
@@ -172,7 +171,7 @@
 			compatible = "ralink,mt7621-spi";
 			reg = <0xb00 0x100>;
 
-			clocks = <&sysclock>;
+			clocks = <&pll MT7621_CLK_BUS>;
 
 			resets = <&rstctrl 18>;
 			reset-names = "spi";
@@ -372,7 +371,7 @@
 		timer {
 			compatible = "mti,gic-timer";
 			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-			clocks = <&cpuclock>;
+			clocks = <&pll MT7621_CLK_CPU>;
 		};
 	};
 
-- 
2.21.0
