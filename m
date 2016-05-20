From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 02/23] ARM: dts: r8a73a4: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:09:53 +0200
Message-ID: <1463728214-13838-3-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /cache-controller@1 has a unit name, but no reg property

Move the cache-controller nodes under the cpus node, and make their
unit names and reg properties match the MPIDR values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add missing 0x-prefix to cache-controller reg property.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 6954912a37537939..ca8672778fe067e1 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -31,6 +31,24 @@
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2_CA15>;
 		};
+
+		L2_CA15: cache-controller@0 {
+			compatible = "cache";
+			reg = <0>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+			power-domains = <&pd_a3sm>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		L2_CA7: cache-controller@100 {
+			compatible = "cache";
+			reg = <0x100>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			power-domains = <&pd_a3km>;
+			cache-unified;
+			cache-level = <2>;
+		};
 	};
 
 	ptm {
@@ -46,22 +64,6 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	L2_CA15: cache-controller@0 {
-		compatible = "cache";
-		clocks = <&cpg_clocks R8A73A4_CLK_Z>;
-		power-domains = <&pd_a3sm>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
-	L2_CA7: cache-controller@1 {
-		compatible = "cache";
-		clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
-		power-domains = <&pd_a3km>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
-- 
1.9.1
