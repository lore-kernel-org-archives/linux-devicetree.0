Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: r8a77470: Add SCIF DMA support
Date: Tue, 24 Apr 2018 09:56:04 +0100
Message-Id: <1524560164-30040-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
References: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add SCIF DMA support for R8A77470 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 39549f2..baec3ca 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -198,6 +198,9 @@
 			clocks = <&cpg CPG_MOD 721>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
+			       <&dmac1 0x29>, <&dmac1 0x2a>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 721>;
 			status = "disabled";
@@ -211,6 +214,9 @@
 			clocks = <&cpg CPG_MOD 720>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
+			       <&dmac1 0x2d>, <&dmac1 0x2e>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 720>;
 			status = "disabled";
@@ -224,6 +230,9 @@
 			clocks = <&cpg CPG_MOD 719>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
+			       <&dmac1 0x2b>, <&dmac1 0x2c>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 719>;
 			status = "disabled";
@@ -237,6 +246,9 @@
 			clocks = <&cpg CPG_MOD 718>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
+			       <&dmac1 0x2f>, <&dmac1 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 718>;
 			status = "disabled";
@@ -250,6 +262,9 @@
 			clocks = <&cpg CPG_MOD 715>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfb>, <&dmac0 0xfc>,
+			       <&dmac1 0xfb>, <&dmac1 0xfc>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 715>;
 			status = "disabled";
@@ -263,6 +278,9 @@
 			clocks = <&cpg CPG_MOD 714>,
 				 <&cpg CPG_CORE 5>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0xfd>, <&dmac0 0xfe>,
+			       <&dmac1 0xfd>, <&dmac1 0xfe>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 714>;
 			status = "disabled";
-- 
2.7.4
