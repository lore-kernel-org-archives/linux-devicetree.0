From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 6/9] ARM: shmobile: r8a7790: add audio dmac node
Date: Mon,  7 Apr 2014 21:07:06 +0100
Message-ID: <1396901229-29117-7-git-send-email-ben.dooks@codethink.co.uk>
References: <1396901229-29117-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1396901229-29117-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux-sh@vger.kernel.org, magnus.damm@opensource.se, horms@verge.net.au, g.liakhovetski@gmx.d, kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: devicetree@vger.kernel.org

Add initial audio dmac node and resources.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/r8a7790.dtsi | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 2c8cbbd..6032783 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -176,6 +176,74 @@
 		};
 	};
 
+	dma1: dma-mux@1 {
+		compatible = "renesas,shdma-mux";
+		#dma-cells = <1>;
+		dma-channels = <20>;
+		dma-requests = <256>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		audiodma0: dmac@ec700000 {
+			compatible = "renesas,dma-r8a7790", "renesas,dma-arm";
+			clocks = <&mstp5_clks R8A7790_CLK_AUDIO_DMAC0>;
+			dma-channels = <13>;
+			status = "disabled";
+			reg = <0 0xec700020 0 0xffc0>;
+			interrupt-parent = <&gic>;
+
+			interrupts =	<0 346 IRQ_TYPE_LEVEL_HIGH>, /* error */
+					<0 320 IRQ_TYPE_LEVEL_HIGH>, /* ch0 */
+					<0 321 IRQ_TYPE_LEVEL_HIGH>,
+					<0 322 IRQ_TYPE_LEVEL_HIGH>,
+					<0 323 IRQ_TYPE_LEVEL_HIGH>,
+					<0 324 IRQ_TYPE_LEVEL_HIGH>,
+					<0 325 IRQ_TYPE_LEVEL_HIGH>,
+					<0 326 IRQ_TYPE_LEVEL_HIGH>,
+					<0 327 IRQ_TYPE_LEVEL_HIGH>,
+					<0 328 IRQ_TYPE_LEVEL_HIGH>,
+					<0 329 IRQ_TYPE_LEVEL_HIGH>,
+					<0 330 IRQ_TYPE_LEVEL_HIGH>,
+					<0 331 IRQ_TYPE_LEVEL_HIGH>,
+					<0 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12";
+		};
+
+		audiodma1: dmac@ec720000 {
+			compatible = "renesas,dma-r8a7790", "renesas,dma-arm";
+			clocks = <&mstp5_clks R8A7790_CLK_AUDIO_DMAC1>;
+			dma-channels = <13>;
+			status = "disabled";
+			reg = <0 0xec720020 0 0xffc0>;
+			interrupt-parent = <&gic>;
+
+			interrupts =	<0 347 IRQ_TYPE_LEVEL_HIGH>, /* error */
+					<0 333 IRQ_TYPE_LEVEL_HIGH>, /* ch0 */
+					<0 334 IRQ_TYPE_LEVEL_HIGH>,
+					<0 335 IRQ_TYPE_LEVEL_HIGH>,
+					<0 336 IRQ_TYPE_LEVEL_HIGH>,
+					<0 337 IRQ_TYPE_LEVEL_HIGH>,
+					<0 338 IRQ_TYPE_LEVEL_HIGH>,
+					<0 339 IRQ_TYPE_LEVEL_HIGH>,
+					<0 340 IRQ_TYPE_LEVEL_HIGH>,
+					<0 341 IRQ_TYPE_LEVEL_HIGH>,
+					<0 342 IRQ_TYPE_LEVEL_HIGH>,
+					<0 343 IRQ_TYPE_LEVEL_HIGH>,
+					<0 344 IRQ_TYPE_LEVEL_HIGH>,
+					<0 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12";
+		};
+	};
+
 	gic: interrupt-controller@f1001000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-- 
1.9.1

