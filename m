Return-Path: <SRS0=lXjp=OG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 13/22] ARM: dts: r8a7744: Add CAN support
Date: Tue, 27 Nov 2018 11:56:26 +0000
Message-Id: <1543319795-48325-14-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add the definitions for can0 and can1 to the r8a7744 SoC dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7744.dtsi | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 9c2e8ea..e6662d9 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -898,13 +898,31 @@
 		};
 
 		can0: can@e6e80000 {
+			compatible = "renesas,can-r8a7744",
+				     "renesas,rcar-gen2-can";
 			reg = <0 0xe6e80000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>,
+				 <&cpg CPG_CORE R8A7744_CLK_RCAN>,
+				 <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			status = "disabled";
 		};
 
 		can1: can@e6e88000 {
+			compatible = "renesas,can-r8a7744",
+				     "renesas,rcar-gen2-can";
 			reg = <0 0xe6e88000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>,
+				 <&cpg CPG_CORE R8A7744_CLK_RCAN>,
+				 <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			status = "disabled";
 		};
 
 		rcar_sound: sound@ec500000 {
-- 
2.7.4
