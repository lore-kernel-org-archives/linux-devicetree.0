From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 1/3] ARM: dts: r7s72100: add ostm clock to device tree
Date: Mon, 23 Jan 2017 08:55:18 -0500
Message-ID: <20170123135520.28834-2-chris.brandt@renesas.com>
References: <20170123135520.28834-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170123135520.28834-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi            | 9 +++++++++
 include/dt-bindings/clock/r7s72100-clock.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 3dd427d..d5946df 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -108,6 +108,15 @@
 			clock-output-names = "scif0", "scif1", "scif2", "scif3", "scif4", "scif5", "scif6", "scif7";
 		};
 
+		mstp5_clks: mstp5_clks@fcfe0428 {
+			#clock-cells = <1>;
+			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0xfcfe0428 4>;
+			clocks = <&p0_clk>, <&p0_clk>;
+			clock-indices = <R7S72100_CLK_OSTM0 R7S72100_CLK_OSTM1>;
+			clock-output-names = "ostm0", "ostm1";
+		};
+
 		mstp7_clks: mstp7_clks@fcfe0430 {
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 29e01ed..ce09915 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -25,6 +25,10 @@
 #define R7S72100_CLK_SCIF6	1
 #define R7S72100_CLK_SCIF7	0
 
+/* MSTP5 */
+#define R7S72100_CLK_OSTM0	1
+#define R7S72100_CLK_OSTM1	0
+
 /* MSTP7 */
 #define R7S72100_CLK_ETHER	4
 
-- 
2.10.1
