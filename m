From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: shmobile: r8a7791: add MLB+ clock
Date: Thu, 18 Dec 2014 23:43:03 +0300
Message-ID: <7846462.yepFC759KH@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>

Add MLB+ clock to R8A7791 device tree.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
[Sergei: rebased, renamed, added changelog]
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against 'renesas-devel-20141218-v3.18' tag of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7791.dtsi            |   10 +++++-----
 include/dt-bindings/clock/r8a7791-clock.h |    1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
+++ renesas/arch/arm/boot/dts/r8a7791.dtsi
@@ -1154,17 +1154,17 @@
 		mstp8_clks: mstp8_clks@e6150990 {
 			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
-			clocks = <&zg_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>, <&p_clk>,
-				 <&zs_clk>, <&zs_clk>;
+			clocks = <&hp_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
+			         <&zg_clk>, <&p_clk>, <&zs_clk>, <&zs_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
-				R8A7791_CLK_IPMMU_SGX
+				R8A7791_CLK_IPMMU_SGX R8A7791_CLK_MLB
 				R8A7791_CLK_VIN2 R8A7791_CLK_VIN1 R8A7791_CLK_VIN0
 				R8A7791_CLK_ETHER R8A7791_CLK_SATA1 R8A7791_CLK_SATA0
 			>;
 			clock-output-names =
-				"ipmmu_sgx", "vin2", "vin1", "vin0", "ether", "sata1",
-				"sata0";
+				"ipmmu_sgx", "mlb", "vin2", "vin1", "vin0", "ether",
+				"sata1", "sata0";
 		};
 		mstp9_clks: mstp9_clks@e6150994 {
 			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
Index: renesas/include/dt-bindings/clock/r8a7791-clock.h
===================================================================
--- renesas.orig/include/dt-bindings/clock/r8a7791-clock.h
+++ renesas/include/dt-bindings/clock/r8a7791-clock.h
@@ -92,6 +92,7 @@
 
 /* MSTP8 */
 #define R8A7791_CLK_IPMMU_SGX		0
+#define R8A7791_CLK_MLB			2
 #define R8A7791_CLK_VIN2		9
 #define R8A7791_CLK_VIN1		10
 #define R8A7791_CLK_VIN0		11
