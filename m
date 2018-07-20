Return-Path: <SRS0=J41Z=KE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a77470: Use r8a77470-sysc binding definitions
Date: Fri, 20 Jul 2018 14:07:02 +0100
Message-Id: <1532092022-64918-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Replace the hardcoded power domain indices by R8A77470_PD_* symbols.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
Commit 964f7c0dd23de68c0 ("soc: renesas: rcar-sysc: Add r8a77470 support") 
is in Linus' tree
---
 arch/arm/boot/dts/r8a77470.dtsi | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 87d32d3..9b218c3 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r8a77470-cpg-mssr.h>
+#include <dt-bindings/power/r8a77470-sysc.h>
 / {
 	compatible = "renesas,r8a77470";
 	#address-cells = <2>;
@@ -23,7 +24,7 @@
 			reg = <0>;
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
-			power-domains = <&sysc 5>;
+			power-domains = <&sysc R8A77470_PD_CA7_CPU0>;
 			next-level-cache = <&L2_CA7>;
 		};
 
@@ -32,7 +33,7 @@
 			compatible = "cache";
 			cache-unified;
 			cache-level = <2>;
-			power-domains = <&sysc 21>;
+			power-domains = <&sysc R8A77470_PD_CA7_SCU>;
 		};
 	};
 
@@ -97,7 +98,7 @@
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 407>;
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 407>;
 		};
 
@@ -151,7 +152,7 @@
 					  "ch12", "ch13", "ch14";
 			clocks = <&cpg CPG_MOD 219>;
 			clock-names = "fck";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 219>;
 			#dma-cells = <1>;
 			dma-channels = <15>;
@@ -184,7 +185,7 @@
 					  "ch12", "ch13", "ch14";
 			clocks = <&cpg CPG_MOD 218>;
 			clock-names = "fck";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 218>;
 			#dma-cells = <1>;
 			dma-channels = <15>;
@@ -196,7 +197,7 @@
 			reg = <0 0xe6800000 0 0x800>, <0 0xee0e8000 0 0x4000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 812>;
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -214,7 +215,7 @@
 			dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
 			       <&dmac1 0x29>, <&dmac1 0x2a>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 721>;
 			status = "disabled";
 		};
@@ -230,7 +231,7 @@
 			dmas = <&dmac0 0x2d>, <&dmac0 0x2e>,
 			       <&dmac1 0x2d>, <&dmac1 0x2e>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 720>;
 			status = "disabled";
 		};
@@ -246,7 +247,7 @@
 			dmas = <&dmac0 0x2b>, <&dmac0 0x2c>,
 			       <&dmac1 0x2b>, <&dmac1 0x2c>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 719>;
 			status = "disabled";
 		};
@@ -262,7 +263,7 @@
 			dmas = <&dmac0 0x2f>, <&dmac0 0x30>,
 			       <&dmac1 0x2f>, <&dmac1 0x30>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 718>;
 			status = "disabled";
 		};
@@ -278,7 +279,7 @@
 			dmas = <&dmac0 0xfb>, <&dmac0 0xfc>,
 			       <&dmac1 0xfb>, <&dmac1 0xfc>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 715>;
 			status = "disabled";
 		};
@@ -294,7 +295,7 @@
 			dmas = <&dmac0 0xfd>, <&dmac0 0xfe>,
 			       <&dmac1 0xfd>, <&dmac1 0xfe>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 714>;
 			status = "disabled";
 		};
@@ -309,7 +310,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 408>;
 		};
 
-- 
2.7.4
