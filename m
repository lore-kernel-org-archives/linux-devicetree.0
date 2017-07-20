From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a77995: Use r8a7795-cpg-mssr binding definitions
Date: Thu, 20 Jul 2017 14:54:37 +0200
Message-ID: <1500555277-22921-5-git-send-email-geert+renesas@glider.be>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Replace the hardcoded clock indices by R8A77995_CLK_* symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "clk: renesas: Add r8a77995 CPG Core Clock Definitions".
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index b984c174cf7edb70..74196882e555929d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -9,7 +9,7 @@
  * kind, whether express or implied.
  */
 
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
+#include <dt-bindings/clock/r8a77995-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a77995-sysc.h>
 
@@ -140,7 +140,7 @@
 			reg = <0 0xe6e88000 0 64>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 310>,
-				 <&cpg CPG_CORE 16>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-- 
2.7.4
