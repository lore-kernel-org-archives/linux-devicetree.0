From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 6/6] staging: mt7621-dts: add dt nodes for mt7621-pll
Date: Wed, 24 Jul 2019 10:23:10 +0800
Message-ID: <20190724022310.28010-7-gch981213@gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724022310.28010-1-gch981213@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit adds device-tree node for mt7621-pll and use its clocks
accordingly.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Changes since v1:
1. drop cpuclock node in gbpc1.dts
2. drop syscon in mt7621-pll node

 drivers/staging/mt7621-dts/gbpc1.dts   |  5 -----
 drivers/staging/mt7621-dts/mt7621.dtsi | 15 +++++++--------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index 1fb560ff059c..d94b73243268 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -106,11 +106,6 @@
 			clock-frequency = <225000000>;
 };
 
-&cpuclock {
-			compatible = "fixed-clock";
-			clock-frequency = <900000000>;
-};
-
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index d89d68ffa7bc..7b82f7f70404 100644
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
+		compatible = "mediatek,mt7621-pll";
 
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
