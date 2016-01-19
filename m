From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: r8a7795: Complete SYS-DMAC nodes
Date: Tue, 19 Jan 2016 10:06:21 +0100
Message-ID: <1453194381-13974-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Complete the dma-controller nodes for SYS-DMAC 0 to 2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
  - Tested with SCIF1, SCIF2, SCIF3, HSCIF1, HSCIF3, HSCIF4, and MSIOF2.

v2:
  - Switch to final CPG/MSSR bindings,
  - Use SoC-specific bindings,
  - (H)SCIF1 RX DMA now works, too.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 93 ++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index bb353cde125333b9..221a8f5d24afaa61 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -333,15 +333,102 @@
 		};
 
 		dmac0: dma-controller@e6700000 {
-			/* Empty node for now */
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6700000 0 0x10000>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 219>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
 		};
 
 		dmac1: dma-controller@e7300000 {
-			/* Empty node for now */
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe7300000 0 0x10000>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 218>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
 		};
 
 		dmac2: dma-controller@e7310000 {
-			/* Empty node for now */
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe7310000 0 0x10000>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 217>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
 		};
 
 		avb: ethernet@e6800000 {
-- 
1.9.1
