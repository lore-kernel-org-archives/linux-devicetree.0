From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 15/15] arm64: dts: allwinner: a64: add SRAM controller device tree node
Date: Wed,  2 May 2018 00:12:27 +0800
Message-ID: <20180501161227.2110-16-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

Allwinner A64 has a SRAM controller, and in the device tree currently
we have a syscon node to enable EMAC driver to access the EMAC clock
register. As SRAM controller driver can now export regmap for this
register, replace the syscon node to the SRAM controller device node,
and let EMAC driver to acquire its EMAC clock regmap.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 1b2ef28c42bd..1c37659d9d41 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -168,10 +168,25 @@
 		#size-cells = <1>;
 		ranges;
 
-		syscon: syscon@1c00000 {
-			compatible = "allwinner,sun50i-a64-system-controller",
-				"syscon";
+		sram_controller: sram-controller@1c00000 {
+			compatible = "allwinner,sun50i-a64-sram-controller";
 			reg = <0x01c00000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram_c: sram@18000 {
+				compatible = "mmio-sram";
+				reg = <0x00018000 0x28000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x00018000 0x28000>;
+
+				de2_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x28000>;
+				};
+			};
 		};
 
 		dma: dma-controller@1c02000 {
@@ -599,7 +614,7 @@
 
 		emac: ethernet@1c30000 {
 			compatible = "allwinner,sun50i-a64-emac";
-			syscon = <&syscon>;
+			syscon = <&sram_controller>;
 			reg = <0x01c30000 0x10000>;
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.17.0
