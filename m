From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH RFC 7/8] ARM: dts: r8a7743: add [H]SCIF support
Date: Fri, 16 Sep 2016 16:37:31 +0300
Message-ID: <2338956.oSVFAsJyhK@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3533019.Wim1Kuh1ic-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe [H]SCIFs in the R8A7743 device tree.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 arch/arm/boot/dts/r8a7743.dtsi |  262 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 262 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7743.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
+++ renesas/arch/arm/boot/dts/r8a7743.dtsi
@@ -154,6 +154,268 @@
 			dma-channels = <15>;
 		};
 
+		scifa0: serial@e6c40000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c40000 0 64>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFA0>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x21>, <&dmac0 0x22>,
+			       <&dmac1 0x21>, <&dmac1 0x22>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifa1: serial@e6c50000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFA1>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x25>, <&dmac0 0x26>,
+			       <&dmac1 0x25>, <&dmac1 0x26>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+	};
+
+		scifa2: serial@e6c60000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c60000 0 64>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFA2>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x27>, <&dmac0 0x28>,
+			       <&dmac1 0x27>, <&dmac1 0x28>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifa3: serial@e6c70000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c70000 0 64>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp11_clks R8A7743_CLK_SCIFA3>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1b>, <&dmac0 0x1c>,
+			       <&dmac1 0x1b>, <&dmac1 0x1c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifa4: serial@e6c78000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c78000 0 64>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp11_clks R8A7743_CLK_SCIFA4>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1f>, <&dmac0 0x20>,
+			       <&dmac1 0x1f>, <&dmac1 0x20>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifa5: serial@e6c80000 {
+			compatible = "renesas,scifa-r8a7743",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c80000 0 64>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp11_clks R8A7743_CLK_SCIFA5>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x23>, <&dmac0 0x24>,
+			       <&dmac1 0x23>, <&dmac1 0x24>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifb0: serial@e6c20000 {
+			compatible = "renesas,scifb-r8a7743",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
+			reg = <0 0xe6c20000 0 64>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFB0>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x3d>, <&dmac0 0x3e>,
+		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifb1: serial@e6c30000 {
+			compatible = "renesas,scifb-r8a7743",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
+			reg = <0 0xe6c30000 0 64>;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFB1>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x19>, <&dmac0 0x1a>,
+			       <&dmac1 0x19>, <&dmac1 0x1a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scifb2: serial@e6ce0000 {
+			compatible = "renesas,scifb-r8a7743",
+				     "renesas,rcar-gen2-scifb", "renesas,scifb";
+			reg = <0 0xe6ce0000 0 64>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp2_clks R8A7743_CLK_SCIFB2>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x1d>, <&dmac0 0x1e>,
+			       <&dmac1 0x1d>, <&dmac1 0x1e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
+			       <&dmac1 0x29>, <&dmac1 0x2a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
+			       <&dmac1 0x2d>, <&dmac1 0x2e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif2: serial@e6e58000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e58000 0 64>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF2>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
+			       <&dmac1 0x2b>, <&dmac1 0x2c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6ea8000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ea8000 0 64>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF3>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
+			       <&dmac1 0x2f>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6ee0000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif",
+				     "renesas,scif";
+			reg = <0 0xe6ee0000 0 64>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF4>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfb>, <&dmac0 0xfc>,
+			       <&dmac1 0xfb>, <&dmac1 0xfc>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif5: serial@e6ee8000 {
+			compatible = "renesas,scif-r8a7743",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ee8000 0 64>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_SCIF5>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfd>, <&dmac0 0xfe>,
+			       <&dmac1 0xfd>, <&dmac1 0xfe>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif0: serial@e62c0000 {
+			compatible = "renesas,hscif-r8a7743",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c0000 0 96>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_HSCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
+			       <&dmac1 0x39>, <&dmac1 0x3a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e62c8000 {
+			compatible = "renesas,hscif-r8a7743",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c8000 0 96>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_HSCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
+			       <&dmac1 0x4d>, <&dmac1 0x4e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e62d0000 {
+			compatible = "renesas,hscif-r8a7743",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62d0000 0 96>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7743_CLK_HSCIF2>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
+			       <&dmac1 0x3b>, <&dmac1 0x3c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7743-cpg-clocks",

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
