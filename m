From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 3/5] ARC: AXS103: DTS: Add core pll node to manage cpu
 frequency
Date: Mon, 14 Aug 2017 19:12:11 +0300
Message-ID: <20170814161213.17522-4-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-snps-arc@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add core pll node (core_clk) to manage cpu frequency.
core_clk represents pll itself.
input_clk represents clock signal source (basically xtal) which
comes to pll input.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/axc003.dtsi     | 11 +++++++++--
 arch/arc/boot/dts/axc003_idu.dtsi | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index cc9239e..dca7e39 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -24,10 +24,17 @@
 
 		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
-		core_clk: core_clk {
+		input_clk: input-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <90000000>;
+			clock-frequency = <33333333>;
+		};
+
+		core_clk: core-clk@80 {
+			compatible = "snps,axs10x-arc-pll-clock";
+			reg = <0x80 0x10>, <0x100 0x10>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
 		};
 
 		core_intc: archs-intc@cpu {
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 4ebb2170..5b56bef 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -24,10 +24,17 @@
 
 		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
-		core_clk: core_clk {
+		input_clk: input-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <100000000>;
+			clock-frequency = <33333333>;
+		};
+
+		core_clk: core-clk@80 {
+			compatible = "snps,axs10x-arc-pll-clock";
+			reg = <0x80 0x10>, <0x100 0x10>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
 		};
 
 		core_intc: archs-intc@cpu {
-- 
2.9.3
