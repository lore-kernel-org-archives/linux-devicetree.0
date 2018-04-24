Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/2] ARM: dts: r8a77470: Add SCIF support
Date: Tue, 24 Apr 2018 09:56:03 +0100
Message-Id: <1524560164-30040-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
References: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Describe SCIF ports in the R8A77470 device tree.
Also it fixes the CPG clock index ZS from 6 to 5.

Fixes: 6929dfc5918049 ("ARM: dts: r8a77470: Initial SoC device tree")
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470.dtsi | 69 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 2f89f33..39549f2 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -190,19 +190,84 @@
 			dma-channels = <15>;
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a77470",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 0x40>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 721>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 721>;
+			status = "disabled";
+		};
+
 		scif1: serial@e6e68000 {
 			compatible = "renesas,scif-r8a77470",
 				     "renesas,rcar-gen2-scif", "renesas,scif";
 			reg = <0 0xe6e68000 0 0x40>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&cpg CPG_MOD 720>,
-				 <&cpg CPG_CORE 6>, <&scif_clk>;
+			clocks = <&cpg CPG_MOD 720>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 720>;
 			status = "disabled";
 		};
 
+		scif2: serial@e6e58000 {
+			compatible = "renesas,scif-r8a77470",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e58000 0 0x40>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 719>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 719>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6ea8000 {
+			compatible = "renesas,scif-r8a77470",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ea8000 0 0x40>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 718>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 718>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6ee0000 {
+			compatible = "renesas,scif-r8a77470",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ee0000 0 0x40>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 715>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 715>;
+			status = "disabled";
+		};
+
+		scif5: serial@e6ee8000 {
+			compatible = "renesas,scif-r8a77470",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ee8000 0 0x40>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>,
+				 <&cpg CPG_CORE 5>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 714>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.7.4
