From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: r8a7792: add QSPI clock
Date: Sat, 03 Sep 2016 01:07:28 +0300
Message-ID: <4143164.BtXsTN0b8O@wasted.cogentembedded.com>
References: <1648590.FPpmBRoQyh@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1648590.FPpmBRoQyh-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe the QSPI clock in the R8A7792 device tree.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 arch/arm/boot/dts/r8a7792.dtsi |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -860,6 +860,7 @@
 			clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&p_clk>, <&p_clk>,
+				 <&cpg_clocks R8A7792_CLK_QSPI>,
 				 <&cp_clk>, <&cp_clk>, <&hp_clk>, <&hp_clk>,
 				 <&hp_clk>, <&hp_clk>, <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
@@ -870,6 +871,7 @@
 				R8A7792_CLK_GPIO1 R8A7792_CLK_GPIO0
 				R8A7792_CLK_GPIO11 R8A7792_CLK_GPIO10
 				R8A7792_CLK_CAN1 R8A7792_CLK_CAN0
+				R8A7792_CLK_QSPI_MOD
 				R8A7792_CLK_GPIO9 R8A7792_CLK_GPIO8
 				R8A7792_CLK_I2C5 R8A7792_CLK_I2C4
 				R8A7792_CLK_I2C3 R8A7792_CLK_I2C2
@@ -879,8 +881,9 @@
 				"gpio7", "gpio6", "gpio5", "gpio4",
 				"gpio3", "gpio2", "gpio1", "gpio0",
 				"gpio11", "gpio10", "can1", "can0",
-				"gpio9", "gpio8", "i2c5", "i2c4",
-				"i2c3",	"i2c2", "i2c1", "i2c0";
+				"qspi_mod", "gpio9", "gpio8",
+				"i2c5", "i2c4", "i2c3", "i2c2",
+				"i2c1", "i2c0";
 		};
 	};
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
