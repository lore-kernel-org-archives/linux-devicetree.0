Return-Path: <SRS0=9gxl=UN=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r8a774c0: Add missing assigned-clocks for CAN[01]
Date: Fri, 14 Jun 2019 12:53:31 +0100
Message-Id: <1560513214-28031-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define "assigned-clocks" and "assigned-clock-rates" properties
for CAN[01] DT nodes, as required by the dt-bindings.

Fixes: 036bc85c1d06 ("arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index e7b5bf2..bdf555f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -973,6 +973,8 @@
 				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
 				 <&can_clk>;
 			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A774C0_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 916>;
 			status = "disabled";
@@ -987,6 +989,8 @@
 				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
 				 <&can_clk>;
 			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A774C0_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 915>;
 			status = "disabled";
-- 
2.7.4
