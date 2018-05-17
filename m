From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: add SMP support
Date: Thu, 17 May 2018 23:19:44 +0300
Message-ID: <ec4c6905-23d1-8600-a1cc-4297fbd1ddaa@cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the device nodes for 3 more Cortex-A53 CPU cores; adjust the interrupt
delivery masks for the ARM GIC and Architectured Timer.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20180516v2-v4.17-rc5' tag of Simon
Horman's 'renesas.git' repo. Tested successfully on the V3M Starter Kit board
(except offlining CPU0 hangs the kernel).

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   40 ++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -30,6 +30,36 @@
 			enable-method = "psci";
 		};
 
+		a53_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <1>;
+			clocks = <&cpg CPG_CORE R8A77980_CLK_Z2>;
+			power-domains = <&sysc R8A77980_PD_CA53_CPU1>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		a53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <2>;
+			clocks = <&cpg CPG_CORE R8A77980_CLK_Z2>;
+			power-domains = <&sysc R8A77980_PD_CA53_CPU2>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		a53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <3>;
+			clocks = <&cpg CPG_CORE R8A77980_CLK_Z2>;
+			power-domains = <&sysc R8A77980_PD_CA53_CPU3>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
 		L2_CA53: cache-controller {
 			compatible = "cache";
 			power-domains = <&sysc R8A77980_PD_CA53_SCU>;
@@ -408,7 +438,7 @@
 			      <0x0 0xf1020000 0 0x20000>,
 			      <0x0 0xf1040000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x20000>;
-			interrupts = <GIC_PPI 9	(GIC_CPU_MASK_SIMPLE(1) |
+			interrupts = <GIC_PPI 9	(GIC_CPU_MASK_SIMPLE(4) |
 				      IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
@@ -424,13 +454,13 @@
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
 				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
 				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) |
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
 				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) |
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
 				       IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
