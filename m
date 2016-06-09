From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 07/12] ARM: dts: r8a7792: add SYS-DMAC support
Date: Fri, 10 Jun 2016 00:43:33 +0300
Message-ID: <2336328.yuWhdAVn4L@wasted.cogentembedded.com>
References: <1879394.3zBGLpF2nv@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1879394.3zBGLpF2nv@wasted.cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe SYS-DMAC0/1 in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- refreshed the patch.

Changes in version 2:
- resolved reject, indenting the device nodes that are now under the "soc" node;
- added Simon's ACK and Geert's tag too.

 arch/arm/boot/dts/r8a7792.dtsi |   64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -88,6 +88,70 @@
 			#power-domain-cells = <1>;
 		};
 
+		dmac0: dma-controller@e6700000 {
+			compatible = "renesas,dmac-r8a7792",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6700000 0 0x20000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH
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
+				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14";
+			clocks = <&mstp2_clks R8A7792_CLK_SYS_DMAC0>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <15>;
+		};
+
+		dmac1: dma-controller@e6720000 {
+			compatible = "renesas,dmac-r8a7792",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6720000 0 0x20000>;
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
+				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14";
+			clocks = <&mstp2_clks R8A7792_CLK_SYS_DMAC1>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <15>;
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7792-cpg-clocks",
