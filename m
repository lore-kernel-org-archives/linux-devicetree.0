Return-Path: <SRS0=9gxl=UN=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 5/6] arm64: dts: renesas: r8a774a1: Add CANFD support
Date: Fri, 14 Jun 2019 12:53:33 +0100
Message-Id: <1560513214-28031-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add CANFD support to the SoC specific dtsi.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 99c5452..d6dd4b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1151,6 +1151,31 @@
 			status = "disabled";
 		};
 
+		canfd: can@e66c0000 {
+			compatible = "renesas,r8a774a1-canfd",
+				     "renesas,rcar-gen3-canfd";
+			reg = <0 0xe66c0000 0 0x8000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 914>,
+				 <&cpg CPG_CORE R8A774A1_CLK_CANFD>,
+				 <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A774A1_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 914>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+
+			channel1 {
+				status = "disabled";
+			};
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 0x8>;
-- 
2.7.4
