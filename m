Return-Path: <SRS0=ZI4B=QW=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Date: Fri, 15 Feb 2019 12:26:29 +0000
Message-Id: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

We usually leave a space between "=" and the value of device
tree properties, but unfortunately that was overlooked for the
"clocks" property of cpu@0 and cpu@1.
This patch fixes the spacing with the "clocks" property of
cpu@0 and cpu@1.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 61a0afb..0bbcaf1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -76,7 +76,7 @@
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -87,7 +87,7 @@
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
-- 
2.7.4
