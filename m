From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] ARM: dts: r8a7792: add VIN clocks
Date: Sat, 23 Jul 2016 22:16:38 +0300
Message-ID: <1477310.o5B8uhf3mT@wasted.cogentembedded.com>
References: <17288006.ERHB6654v5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <17288006.ERHB6654v5@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the VIN[0-5] clocks and their parent, ZG clock in the R8A7792
device  tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -643,6 +643,13 @@
 			clock-div = <49>;
 			clock-mult = <1>;
 		};
+		zg_clk: zg {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpg_clocks R8A7792_CLK_PLL1>;
+			#clock-cells = <0>;
+			clock-div = <5>;
+			clock-mult = <1>;
+		};
 
 		/* Gate clocks */
 		mstp1_clks: mstp1_clks@e6150134 {
@@ -702,10 +709,17 @@
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
-			clocks = <&hp_clk>;
+			clocks = <&zg_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
+			         <&zg_clk>, <&zg_clk>, <&hp_clk>;
 			#clock-cells = <1>;
-			clock-indices = <R8A7792_CLK_ETHERAVB>;
-			clock-output-names = "etheravb";
+			clock-indices = <
+				R8A7792_CLK_VIN5 R8A7792_CLK_VIN4
+				R8A7792_CLK_VIN3 R8A7792_CLK_VIN2
+				R8A7792_CLK_VIN1 R8A7792_CLK_VIN0
+				R8A7792_CLK_ETHERAVB
+			>;
+			clock-output-names = "vin5", "vin4", "vin3", "vin2",
+					     "vin1", "vin0", "etheravb";
 		};
 		mstp9_clks: mstp9_clks@e6150994 {
 			compatible = "renesas,r8a7792-mstp-clocks",
