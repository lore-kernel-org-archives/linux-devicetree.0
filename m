Return-Path: <SRS0=x9uM=UL=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r8a774a1: Add CPU capacity-dmips-mhz
Date: Wed, 12 Jun 2019 15:20:53 +0100
Message-Id: <1560349255-26336-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
References: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Set the capacity-dmips-mhz for RZ/G2M(r8a774a1) SoC, that is based on
dhrystone.

Based on work done by Gaku Inami <gaku.inami.xw@bp.renesas.com> for
r8a7796 SoC.

The average dhrystone result for 5 iterations is as below:

r8a774a1 SoC (CA57x2 + CA53x4)
  CPU   max-freq   dhrystone
  ---------------------------------
  CA57   1500 MHz  11428571 lps/s
  CA53   1200 MHz   5000000 lps/s

>From this, CPU capacity-dmips-mhz for CA57 and CA53 are calculated
as follows:

r8a774a1 SoC
  CA57 : 1024 / (11428571 / 1500) * (11428571 / 1500) = 1024
  CA53 : 1024 / (11428571 / 1500) * ( 5000000 / 1200) =  560

Since each CPUs have different max frequencies, the final CPU
capacities of A53 scaled by the above difference is as below

$ cat /sys/devices/system/cpu/cpu*/cpu_capacity
1024
1024
448
448
448
448

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index e6ea5a1..603cfdb 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -137,6 +137,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		a57_1: cpu@1 {
@@ -148,6 +149,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		a53_0: cpu@100 {
@@ -159,6 +161,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_1: cpu@101 {
@@ -170,6 +173,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_2: cpu@102 {
@@ -181,6 +185,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_3: cpu@103 {
@@ -192,6 +197,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		L2_CA57: cache-controller-0 {
-- 
2.7.4
