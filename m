From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] ARM: dts: r8a7792: add SD clocks
Date: Sat, 23 Jul 2016 21:10:31 +0300
Message-ID: <2958440.dIj6ehVyCb@wasted.cogentembedded.com>
References: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the SDHI0 clock and its parent, SD clock in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- refreshed the patch.

 arch/arm/boot/dts/r8a7792.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -535,6 +535,13 @@
 			clock-div = <8>;
 			clock-mult = <1>;
 		};
+		sd_clk: sd {
+			compatible = "fixed-factor-clock";
+			clocks = <&pll1_div2_clk>;
+			#clock-cells = <0>;
+			clock-div = <8>;
+			clock-mult = <1>;
+		};
 		rcan_clk: rcan {
 			compatible = "fixed-factor-clock";
 			clocks = <&pll1_div2_clk>;
@@ -564,6 +571,15 @@
 			>;
 			clock-output-names = "sys-dmac1", "sys-dmac0";
 		};
+		mstp3_clks: mstp3_clks@e615013c {
+			compatible = "renesas,r8a7792-mstp-clocks",
+				     "renesas,cpg-mstp-clocks";
+			reg = <0 0xe615013c 0 4>, <0 0xe6150048 0 4>;
+			clocks = <&sd_clk>;
+			#clock-cells = <1>;
+			renesas,clock-indices = <R8A7792_CLK_SDHI0>;
+			clock-output-names = "sdhi0";
+		};
 		mstp4_clks: mstp4_clks@e6150140 {
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
