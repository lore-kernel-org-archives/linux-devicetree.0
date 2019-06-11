Return-Path: <SRS0=x+Gy=UK=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r8a774a1: Add TMU device nodes
Date: Tue, 11 Jun 2019 14:06:41 +0100
Message-Id: <1560258401-9517-7-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds TMU[01234] device tree nodes to the r8a774a1
SoC specific DT.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 65 +++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index b8a423d..f4aeb9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -495,6 +495,71 @@
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a774a1", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@e6fc0000 {
+			compatible = "renesas,tmu-r8a774a1", "renesas,tmu";
+			reg = <0 0xe6fc0000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 124>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 124>;
+			status = "disabled";
+		};
+
+		tmu2: timer@e6fd0000 {
+			compatible = "renesas,tmu-r8a774a1", "renesas,tmu";
+			reg = <0 0xe6fd0000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 123>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 123>;
+			status = "disabled";
+		};
+
+		tmu3: timer@e6fe0000 {
+			compatible = "renesas,tmu-r8a774a1", "renesas,tmu";
+			reg = <0 0xe6fe0000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu4: timer@ffc00000 {
+			compatible = "renesas,tmu-r8a774a1", "renesas,tmu";
+			reg = <0 0xffc00000 0 0x30>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4
