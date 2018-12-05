Return-Path: <SRS0=5gDw=OO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 5/5] ARM: dts: r8a7744: Fix sorting of vsp and msiof nodes
Date: Wed,  5 Dec 2018 09:06:55 +0000
Message-Id: <1544000815-28069-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch fixes sorting of vsp and msiof nodes.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * No change. It is a new patch.
---
 arch/arm/boot/dts/r8a7744.dtsi | 150 ++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 6a51b16..83804aa 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -998,6 +998,54 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e20000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e20000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 000>;
+			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
+			       <&dmac1 0x51>, <&dmac1 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 000>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6e10000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e10000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
+			       <&dmac1 0x55>, <&dmac1 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 208>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6e00000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 205>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
+			       <&dmac1 0x41>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 205>;
+			status = "disabled";
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a7744", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 0x8>;
@@ -1068,54 +1116,6 @@
 			status = "disabled";
 		};
 
-		msiof0: spi@e6e20000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e20000 0 0x0064>;
-			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 000>;
-			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
-			       <&dmac1 0x51>, <&dmac1 0x52>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 000>;
-			status = "disabled";
-		};
-
-		msiof1: spi@e6e10000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e10000 0 0x0064>;
-			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 208>;
-			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
-			       <&dmac1 0x55>, <&dmac1 0x56>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 208>;
-			status = "disabled";
-		};
-
-		msiof2: spi@e6e00000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e00000 0 0x0064>;
-			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 205>;
-			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
-			       <&dmac1 0x41>, <&dmac1 0x42>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 205>;
-			status = "disabled";
-		};
-
 		can0: can@e6e80000 {
 			compatible = "renesas,can-r8a7744",
 				     "renesas,rcar-gen2-can";
@@ -1589,33 +1589,6 @@
 			resets = <&cpg 408>;
 		};
 
-		vsp@fe928000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe928000 0 0x8000>;
-			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 131>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 131>;
-		};
-
-		vsp@fe930000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe930000 0 0x8000>;
-			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 128>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 128>;
-		};
-
-		vsp@fe938000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe938000 0 0x8000>;
-			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 127>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 127>;
-		};
-
 		pciec: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7744",
 				     "renesas,pcie-rcar-gen2";
@@ -1644,6 +1617,33 @@
 			status = "disabled";
 		};
 
+		vsp@fe928000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe928000 0 0x8000>;
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 131>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 131>;
+		};
+
+		vsp@fe930000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe930000 0 0x8000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 128>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 128>;
+		};
+
+		vsp@fe938000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe938000 0 0x8000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 127>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 127>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7744";
 			reg = <0 0xfeb00000 0 0x40000>;
-- 
2.7.4
