From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 07/11] ARM: dts: r8a7792: add [H]SCIF support
Date: Sat, 04 Jun 2016 00:30:08 +0300
Message-ID: <2050435.9N7hsYjAbh@wasted.cogentembedded.com>
References: <3446154.oZ24315zaL@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3446154.oZ24315zaL-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe [H]SCIFs in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changes in version 2:
- resolved reject, indenting the device nodes that are now under the "soc" node;
- added Geert's tag.

 arch/arm/boot/dts/r8a7792.dtsi |   90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -143,6 +143,96 @@
 			dma-channels = <15>;
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
+			       <&dmac1 0x29>, <&dmac1 0x2a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
+			       <&dmac1 0x2d>, <&dmac1 0x2e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif2: serial@e6e58000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6e58000 0 64>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF2>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
+			       <&dmac1 0x2b>, <&dmac1 0x2c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6ea8000 {
+			compatible = "renesas,scif-r8a7792",
+				     "renesas,rcar-gen2-scif", "renesas,scif";
+			reg = <0 0xe6ea8000 0 64>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_SCIF3>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
+			       <&dmac1 0x2f>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif0: serial@e62c0000 {
+			compatible = "renesas,hscif-r8a7792",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c0000 0 96>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_HSCIF0>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
+			       <&dmac1 0x39>, <&dmac1 0x3a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e62c8000 {
+			compatible = "renesas,hscif-r8a7792",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c8000 0 96>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp7_clks R8A7792_CLK_HSCIF1>, <&zs_clk>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
+			       <&dmac1 0x4d>, <&dmac1 0x4e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7792-cpg-clocks",

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
