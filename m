From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] ARM: dts: r8a7792: add DU clocks
Date: Fri, 05 Aug 2016 21:25:47 +0300
Message-ID: <2482521.XCJrVWGkiq@wasted.cogentembedded.com>
References: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the DU0/1 clocks and their parent, ZX clock in the R8A7792 device
tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -660,6 +660,13 @@
 			clock-div = <2>;
 			clock-mult = <1>;
 		};
+		zx_clk: zx {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
+			#clock-cells = <0>;
+			clock-div = <3>;
+			clock-mult = <1>;
+		};
 		zs_clk: zs {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
@@ -761,15 +768,17 @@
 				     "renesas,cpg-mstp-clocks";
 			reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
 			clocks = <&zs_clk>, <&zs_clk>, <&p_clk>, <&p_clk>,
-				 <&p_clk>, <&p_clk>;
+				 <&p_clk>, <&p_clk>, <&zx_clk>, <&zx_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
 				R8A7792_CLK_HSCIF1 R8A7792_CLK_HSCIF0
 				R8A7792_CLK_SCIF3 R8A7792_CLK_SCIF2
 				R8A7792_CLK_SCIF1 R8A7792_CLK_SCIF0
+				R8A7792_CLK_DU1 R8A7792_CLK_DU0
 			>;
 			clock-output-names = "hscif1", "hscif0", "scif3",
-					     "scif2", "scif1", "scif0";
+					     "scif2", "scif1", "scif0",
+					     "du1", "du0";
 		};
 		mstp8_clks: mstp8_clks@e6150990 {
 			compatible = "renesas,r8a7792-mstp-clocks",
