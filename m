Return-Path: <>
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a7795: Add cpu capacity-dmips-mhz
Date: Tue, 27 Feb 2018 11:19:53 +0900
Message-Id: <1519697995-6061-4-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Set the capacity-dmips-mhz for r8a7795, that is based on dhrystone.

Expected cpu capacity:
Cortex-A57@1.5GHz: 1024, Cortex-A53@1.2GHz: 411

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index ffcc91e..be15864 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -75,6 +75,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 		};
 
@@ -87,6 +88,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 		};
 
@@ -99,6 +101,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 		};
 
@@ -111,6 +114,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 		};
 
@@ -123,6 +127,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <411>;
 		};
 
 		a53_1: cpu@101 {
@@ -134,6 +139,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <411>;
 		};
 
 		a53_2: cpu@102 {
@@ -145,6 +151,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <411>;
 		};
 
 		a53_3: cpu@103 {
@@ -156,6 +163,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <411>;
 		};
 
 		L2_CA57: cache-controller-0 {
-- 
2.7.4
