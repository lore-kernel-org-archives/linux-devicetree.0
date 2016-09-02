From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] ARM: dts: r7s72100: add ethernet clock to device tree
Date: Thu,  1 Sep 2016 21:40:10 -0400
Message-ID: <20160902014012.9383-1-chris.brandt@renesas.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160901155430.23400-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* Added MSTP7 clock node
---
 arch/arm/boot/dts/r7s72100.dtsi            | 9 +++++++++
 include/dt-bindings/clock/r7s72100-clock.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e8e2a5d7..6d29e8f 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -108,6 +108,15 @@
 			clock-output-names = "scif0", "scif1", "scif2", "scif3", "scif4", "scif5", "scif6", "scif7";
 		};
 
+		mstp7_clks: mstp7_clks@fcfe0430 {
+			#clock-cells = <1>;
+			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0xfcfe0430 4>;
+			clocks = <&p0_clk>;
+			clock-indices = <R7S72100_CLK_ETHER>;
+			clock-output-names = "ether";
+		};
+
 		mstp9_clks: mstp9_clks@fcfe0438 {
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 5128f4d..3cd8138 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -25,6 +25,9 @@
 #define R7S72100_CLK_SCIF6	1
 #define R7S72100_CLK_SCIF7	0
 
+/* MSTP7 */
+#define R7S72100_CLK_ETHER	4
+
 /* MSTP9 */
 #define R7S72100_CLK_I2C0	7
 #define R7S72100_CLK_I2C1	6
-- 
2.9.2
