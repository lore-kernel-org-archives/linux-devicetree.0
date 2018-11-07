Return-Path: <SRS0=70sl=NS=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774a1: Replace clock magic numbers
Date: Wed,  7 Nov 2018 15:24:27 +0000
Message-Id: <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Now that include/dt-bindings/clock/r8a774a1-cpg-mssr.h is in Linus'
master branch we can replace clock related magic numbers with the
corresponding labels.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 38 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d549755..e0f8bd9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
+#include <dt-bindings/clock/r8a774a1-cpg-mssr.h>
 #include <dt-bindings/power/r8a774a1-sysc.h>
 
 / {
@@ -67,7 +67,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks = <&cpg CPG_CORE 0>;
+			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 		};
 
 		a57_1: cpu@1 {
@@ -77,7 +77,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks = <&cpg CPG_CORE 0>;
+			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 		};
 
 		a53_0: cpu@100 {
@@ -87,7 +87,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 1>;
+			clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
 		};
 
 		a53_1: cpu@101 {
@@ -97,7 +97,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 1>;
+			clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
 		};
 
 		a53_2: cpu@102 {
@@ -107,7 +107,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 1>;
+			clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
 		};
 
 		a53_3: cpu@103 {
@@ -117,7 +117,7 @@
 			power-domains = <&sysc R8A774A1_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 1>;
+			clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
 		};
 
 		L2_CA57: cache-controller-0 {
@@ -515,7 +515,7 @@
 			reg = <0 0xe6540000 0 0x60>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 520>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
@@ -533,7 +533,7 @@
 			reg = <0 0xe6550000 0 0x60>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 519>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x33>, <&dmac1 0x32>,
@@ -551,7 +551,7 @@
 			reg = <0 0xe6560000 0 0x60>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 518>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
@@ -569,7 +569,7 @@
 			reg = <0 0xe66a0000 0 0x60>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 517>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
@@ -586,7 +586,7 @@
 			reg = <0 0xe66b0000 0 0x60>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 516>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x39>, <&dmac0 0x38>;
@@ -974,7 +974,7 @@
 			reg = <0 0xe6e60000 0 0x40>;
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 207>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
@@ -991,7 +991,7 @@
 			reg = <0 0xe6e68000 0 0x40>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 206>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
@@ -1008,7 +1008,7 @@
 			reg = <0 0xe6e88000 0 0x40>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 310>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -1022,7 +1022,7 @@
 			reg = <0 0xe6c50000 0 0x40>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 204>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
@@ -1038,7 +1038,7 @@
 			reg = <0 0xe6c40000 0 0x40>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 203>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
@@ -1054,7 +1054,7 @@
 			reg = <0 0xe6f30000 0 0x40>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 202>,
-				 <&cpg CPG_CORE 19>,
+				 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
@@ -1420,7 +1420,7 @@
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE 10>;
+				 <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.7.4
