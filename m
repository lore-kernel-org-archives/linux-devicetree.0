Return-Path: <SRS0=X76U=OJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 08/21] ARM: dts: r8a7744: Add [H]SCIF{A|B} support
Date: Fri, 30 Nov 2018 15:26:22 +0000
Message-Id: <1543591595-37861-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Describe [H]SCIF{|A|B} ports in the R8A7744 device tree.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
   * No Change
---
 arch/arm/boot/dts/r8a7744.dtsi | 257 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 254 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 2cb6d8f..1fe694d 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -414,9 +414,139 @@
 			status = "disabled";
 		};
 
+		scifa0: serial@e6c40000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c40000 0 0x40>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 204>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x21>, <&dmac0 0x22>,
+			       <&dmac1 0x21>, <&dmac1 0x22>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 204>;
+			status = "disabled";
+		};
+
+		scifa1: serial@e6c50000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c50000 0 0x40>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 203>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x25>, <&dmac0 0x26>,
+			       <&dmac1 0x25>, <&dmac1 0x26>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 203>;
+			status = "disabled";
+		};
+
+		scifa2: serial@e6c60000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c60000 0 0x40>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 202>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x27>, <&dmac0 0x28>,
+			       <&dmac1 0x27>, <&dmac1 0x28>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 202>;
+			status = "disabled";
+		};
+
+		scifa3: serial@e6c70000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c70000 0 0x40>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1106>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1b>, <&dmac0 0x1c>,
+			       <&dmac1 0x1b>, <&dmac1 0x1c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 1106>;
+			status = "disabled";
+		};
+
+		scifa4: serial@e6c78000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c78000 0 0x40>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1107>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1f>, <&dmac0 0x20>,
+			       <&dmac1 0x1f>, <&dmac1 0x20>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 1107>;
+			status = "disabled";
+		};
+
+		scifa5: serial@e6c80000 {
+			compatible = "renesas,scifa-r8a7744",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c80000 0 0x40>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1108>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x23>, <&dmac0 0x24>,
+			       <&dmac1 0x23>, <&dmac1 0x24>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 1108>;
+			status = "disabled";
+		};
+
+		scifb0: serial@e6c20000 {
+			compatible = "renesas,scifb-r8a7744",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
+			reg = <0 0xe6c20000 0 0x100>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 206>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x3d>, <&dmac0 0x3e>,
+			       <&dmac1 0x3d>, <&dmac1 0x3e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 206>;
+			status = "disabled";
+		};
+
 		scifb1: serial@e6c30000 {
+			compatible = "renesas,scifb-r8a7744",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
 			reg = <0 0xe6c30000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 207>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x19>, <&dmac0 0x1a>,
+			       <&dmac1 0x19>, <&dmac1 0x1a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 207>;
+			status = "disabled";
+		};
+
+		scifb2: serial@e6ce0000 {
+			compatible = "renesas,scifb-r8a7744",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
+			reg = <0 0xe6ce0000 0 0x100>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 216>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1d>, <&dmac0 0x1e>,
+			       <&dmac1 0x1d>, <&dmac1 0x1e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 216>;
+			status = "disabled";
 		};
 
 		scif0: serial@e6e60000 {
@@ -427,19 +557,140 @@
 			clocks = <&cpg CPG_MOD 721>,
 				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
+			       <&dmac1 0x29>, <&dmac1 0x2a>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
 			resets = <&cpg 721>;
 			status = "disabled";
 		};
 
 		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a7744",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
 			reg = <0 0xe6e68000 0 0x40>;
-			/* placeholder */
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 720>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
+			       <&dmac1 0x2d>, <&dmac1 0x2e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 720>;
+			status = "disabled";
+		};
+
+		scif2: serial@e6e58000 {
+			compatible = "renesas,scif-r8a7744",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e58000 0 0x40>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 719>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
+			       <&dmac1 0x2b>, <&dmac1 0x2c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 719>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6ea8000 {
+			compatible = "renesas,scif-r8a7744",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ea8000 0 0x40>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 718>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
+			       <&dmac1 0x2f>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 718>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6ee0000 {
+			compatible = "renesas,scif-r8a7744",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ee0000 0 0x40>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 715>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfb>, <&dmac0 0xfc>,
+			       <&dmac1 0xfb>, <&dmac1 0xfc>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 715>;
+			status = "disabled";
+		};
+
+		scif5: serial@e6ee8000 {
+			compatible = "renesas,scif-r8a7744",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ee8000 0 0x40>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfd>, <&dmac0 0xfe>,
+			       <&dmac1 0xfd>, <&dmac1 0xfe>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 714>;
+			status = "disabled";
+		};
+
+		hscif0: serial@e62c0000 {
+			compatible = "renesas,hscif-r8a7744",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c0000 0 0x60>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 717>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
+			       <&dmac1 0x39>, <&dmac1 0x3a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 717>;
+			status = "disabled";
 		};
 
 		hscif1: serial@e62c8000 {
+			compatible = "renesas,hscif-r8a7744",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
 			reg = <0 0xe62c8000 0 0x60>;
-			/* placeholder */
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
+			       <&dmac1 0x4d>, <&dmac1 0x4e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e62d0000 {
+			compatible = "renesas,hscif-r8a7744",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62d0000 0 0x60>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 713>,
+				 <&cpg CPG_CORE R8A7744_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
+			       <&dmac1 0x3b>, <&dmac1 0x3c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 713>;
+			status = "disabled";
 		};
 
 		can0: can@e6e80000 {
-- 
2.7.4
