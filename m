Return-Path: <SRS0=X76U=OJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 19/21] ARM: dts: r8a7744: Add IRQC support
Date: Fri, 30 Nov 2018 15:26:33 +0000
Message-Id: <1543591595-37861-20-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Describe the IRQC interrupt controller in the r8a7744 device tree.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
   * No Change
---
 arch/arm/boot/dts/r8a7744.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 87187f2..91096c3 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -297,6 +297,26 @@
 			#power-domain-cells = <1>;
 		};
 
+		irqc: interrupt-controller@e61c0000 {
+			compatible = "renesas,irqc-r8a7744", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
+		};
+
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
-- 
2.7.4
