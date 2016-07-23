From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] ARM: dts: r8a7792: add I2C clocks
Date: Sat, 23 Jul 2016 21:48:33 +0300
Message-ID: <1841031.5KOUl1WdV5@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the I2C[0-5] clocks in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -632,7 +632,8 @@
 			clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&p_clk>, <&p_clk>,
-				 <&cp_clk>, <&cp_clk>;
+				 <&cp_clk>, <&cp_clk>, <&hp_clk>, <&hp_clk>,
+				 <&hp_clk>, <&hp_clk>, <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
 				R8A7792_CLK_GPIO7 R8A7792_CLK_GPIO6
@@ -642,12 +643,16 @@
 				R8A7792_CLK_GPIO11 R8A7792_CLK_GPIO10
 				R8A7792_CLK_CAN1 R8A7792_CLK_CAN0
 				R8A7792_CLK_GPIO9 R8A7792_CLK_GPIO8
+				R8A7792_CLK_I2C5 R8A7792_CLK_I2C4
+				R8A7792_CLK_I2C3 R8A7792_CLK_I2C2
+				R8A7792_CLK_I2C1 R8A7792_CLK_I2C0
 			>;
 			clock-output-names =
 				"gpio7", "gpio6", "gpio5", "gpio4",
 				"gpio3", "gpio2", "gpio1", "gpio0",
 				"gpio11", "gpio10", "can1", "can0",
-				"gpio9", "gpio8";
+				"gpio9", "gpio8", "i2c5", "i2c4",
+				"i2c3",	"i2c2", "i2c1", "i2c0";
 		};
 	};
 
