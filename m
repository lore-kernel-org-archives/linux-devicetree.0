From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: r8a77995: Use r8a7795-sysc binding definitions
Date: Thu, 20 Jul 2017 14:54:36 +0200
Message-ID: <1500555277-22921-4-git-send-email-geert+renesas@glider.be>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Replace the hardcoded power domain indices by R8A77995_PD_* symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "soc: renesas: rcar-sysc: Add support for R-Car D3 power
areas".
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 7c69b795cd3ebd82..b984c174cf7edb70 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -11,6 +11,7 @@
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a77995-sysc.h>
 
 / {
 	compatible = "renesas,r8a77995";
@@ -30,14 +31,14 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0>;
 			device_type = "cpu";
-			power-domains = <&sysc 5>;
+			power-domains = <&sysc R8A77995_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 		};
 
 		L2_CA53: cache-controller-1 {
 			compatible = "cache";
-			power-domains = <&sysc 21>;
+			power-domains = <&sysc R8A77995_PD_CA53_SCU>;
 			cache-unified;
 			cache-level = <2>;
 		};
@@ -76,7 +77,7 @@
 					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 408>;
 		};
 
@@ -97,7 +98,7 @@
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
 			clocks = <&cpg CPG_MOD 402>;
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
 			status = "disabled";
 		};
@@ -142,7 +143,7 @@
 				 <&cpg CPG_CORE 16>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			power-domains = <&sysc 32>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
 		};
-- 
2.7.4
