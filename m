Return-Path: <SRS0=X76U=OJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 10/21] ARM: dts: r8a7744: Add SDHI nodes
Date: Fri, 30 Nov 2018 15:26:24 +0000
Message-Id: <1543591595-37861-11-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add SDHI nodes to the DT of the r8a7744 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
   * No Change
---
 arch/arm/boot/dts/r8a7744.dtsi | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 57e0be3..97b417c 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -866,14 +866,49 @@
 			/* placeholder */
 		};
 
+		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
+			reg = <0 0xee100000 0 0x328>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+			       <&dmac1 0xcd>, <&dmac1 0xce>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <195000000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
+		};
+
 		sdhi1: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee140000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
+			       <&dmac1 0xc1>, <&dmac1 0xc2>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 312>;
+			status = "disabled";
 		};
 
 		sdhi2: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a7744",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee160000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
+			       <&dmac1 0xd3>, <&dmac1 0xd4>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <97500000>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@f1001000 {
-- 
2.7.4
