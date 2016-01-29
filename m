From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 5/7] ARM: dts: r8a7793: Add SCIF fallback compatibility strings
Date: Fri, 29 Jan 2016 10:32:06 +0100
Message-ID: <1454059928-975-6-git-send-email-geert+renesas@glider.be>
References: <1454059928-975-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454059928-975-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Change one-line summary prefix to match current arm-soc practices,

v3:
  - New.
---
 arch/arm/boot/dts/r8a7793.dtsi | 54 ++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 6817f14314e2b098..b49f9271ceb308c1 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -479,7 +479,8 @@
 	};
 
 	scifa0: serial@e6c40000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c40000 0 64>;
 		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFA0>;
@@ -491,7 +492,8 @@
 	};
 
 	scifa1: serial@e6c50000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c50000 0 64>;
 		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFA1>;
@@ -503,7 +505,8 @@
 	};
 
 	scifa2: serial@e6c60000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c60000 0 64>;
 		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFA2>;
@@ -515,7 +518,8 @@
 	};
 
 	scifa3: serial@e6c70000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c70000 0 64>;
 		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp11_clks R8A7793_CLK_SCIFA3>;
@@ -527,7 +531,8 @@
 	};
 
 	scifa4: serial@e6c78000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c78000 0 64>;
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp11_clks R8A7793_CLK_SCIFA4>;
@@ -539,7 +544,8 @@
 	};
 
 	scifa5: serial@e6c80000 {
-		compatible = "renesas,scifa-r8a7793", "renesas,scifa";
+		compatible = "renesas,scifa-r8a7793",
+			     "renesas,rcar-gen2-scifa", "renesas,scifa";
 		reg = <0 0xe6c80000 0 64>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp11_clks R8A7793_CLK_SCIFA5>;
@@ -551,7 +557,8 @@
 	};
 
 	scifb0: serial@e6c20000 {
-		compatible = "renesas,scifb-r8a7793", "renesas,scifb";
+		compatible = "renesas,scifb-r8a7793",
+			     "renesas,rcar-gen2-scifb", "renesas,scifb";
 		reg = <0 0xe6c20000 0 64>;
 		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFB0>;
@@ -563,7 +570,8 @@
 	};
 
 	scifb1: serial@e6c30000 {
-		compatible = "renesas,scifb-r8a7793", "renesas,scifb";
+		compatible = "renesas,scifb-r8a7793",
+			     "renesas,rcar-gen2-scifb", "renesas,scifb";
 		reg = <0 0xe6c30000 0 64>;
 		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFB1>;
@@ -575,7 +583,8 @@
 	};
 
 	scifb2: serial@e6ce0000 {
-		compatible = "renesas,scifb-r8a7793", "renesas,scifb";
+		compatible = "renesas,scifb-r8a7793",
+			     "renesas,rcar-gen2-scifb", "renesas,scifb";
 		reg = <0 0xe6ce0000 0 64>;
 		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7793_CLK_SCIFB2>;
@@ -587,7 +596,8 @@
 	};
 
 	scif0: serial@e6e60000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6e60000 0 64>;
 		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF0>;
@@ -599,7 +609,8 @@
 	};
 
 	scif1: serial@e6e68000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6e68000 0 64>;
 		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF1>;
@@ -611,7 +622,8 @@
 	};
 
 	scif2: serial@e6e58000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6e58000 0 64>;
 		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF2>;
@@ -623,7 +635,8 @@
 	};
 
 	scif3: serial@e6ea8000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6ea8000 0 64>;
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF3>;
@@ -635,7 +648,8 @@
 	};
 
 	scif4: serial@e6ee0000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6ee0000 0 64>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF4>;
@@ -647,7 +661,8 @@
 	};
 
 	scif5: serial@e6ee8000 {
-		compatible = "renesas,scif-r8a7793", "renesas,scif";
+		compatible = "renesas,scif-r8a7793", "renesas,rcar-gen2-scif",
+			     "renesas,scif";
 		reg = <0 0xe6ee8000 0 64>;
 		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_SCIF5>;
@@ -659,7 +674,8 @@
 	};
 
 	hscif0: serial@e62c0000 {
-		compatible = "renesas,hscif-r8a7793", "renesas,hscif";
+		compatible = "renesas,hscif-r8a7793",
+			     "renesas,rcar-gen2-hscif", "renesas,hscif";
 		reg = <0 0xe62c0000 0 96>;
 		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_HSCIF0>;
@@ -671,7 +687,8 @@
 	};
 
 	hscif1: serial@e62c8000 {
-		compatible = "renesas,hscif-r8a7793", "renesas,hscif";
+		compatible = "renesas,hscif-r8a7793",
+			     "renesas,rcar-gen2-hscif", "renesas,hscif";
 		reg = <0 0xe62c8000 0 96>;
 		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_HSCIF1>;
@@ -683,7 +700,8 @@
 	};
 
 	hscif2: serial@e62d0000 {
-		compatible = "renesas,hscif-r8a7793", "renesas,hscif";
+		compatible = "renesas,hscif-r8a7793",
+			     "renesas,rcar-gen2-hscif", "renesas,hscif";
 		reg = <0 0xe62d0000 0 96>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp7_clks R8A7793_CLK_HSCIF2>;
-- 
1.9.1
