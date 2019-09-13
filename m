Return-Path: <SRS0=8ID0=XI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Add dynamic power coefficient
Date: Fri, 13 Sep 2019 09:50:08 +0100
Message-Id: <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Describe the dynamic power coefficient of A53 CPUs.

Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 764df4c..c7bdc36 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -77,6 +77,7 @@
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			dynamic-power-coefficient = <277>;
 			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
-- 
2.7.4
