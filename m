From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] ARM: dts: r8a7792: add GPIO clocks
Date: Wed, 06 Jul 2016 01:01:22 +0300
Message-ID: <11061301.qvrr4LnqPm@wasted.cogentembedded.com>
References: <19087307.ZHtRY0pPL5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <19087307.ZHtRY0pPL5@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the GPIO clocks in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- converted stray spaces to a tab;
- added Geert's tag.

 arch/arm/boot/dts/r8a7792.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -363,6 +363,27 @@
 			clock-output-names = "hscif1", "hscif0", "scif3",
 					     "scif2", "scif1", "scif0";
 		};
+		mstp9_clks: mstp9_clks@e6150994 {
+			compatible = "renesas,r8a7792-mstp-clocks",
+				     "renesas,cpg-mstp-clocks";
+			reg = <0 0xe6150994 0 4>, <0 0xe61509a4 0 4>;
+			clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
+				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
+				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>;
+			#clock-cells = <1>;
+			clock-indices = <
+				R8A7792_CLK_GPIO7 R8A7792_CLK_GPIO6
+				R8A7792_CLK_GPIO5 R8A7792_CLK_GPIO4
+				R8A7792_CLK_GPIO3 R8A7792_CLK_GPIO2
+				R8A7792_CLK_GPIO1 R8A7792_CLK_GPIO0
+				R8A7792_CLK_GPIO11 R8A7792_CLK_GPIO10
+				R8A7792_CLK_GPIO9 R8A7792_CLK_GPIO8
+			>;
+			clock-output-names =
+				"gpio7", "gpio6", "gpio5", "gpio4",
+				"gpio3", "gpio2", "gpio1", "gpio0",
+				"gpio11", "gpio10", "gpio9", "gpio8";
+		};
 	};
 
 	/* External root clock */
