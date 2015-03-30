From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] ARM: shmobile: r8a7790: add EtherAVB clock
Date: Tue, 31 Mar 2015 00:58:23 +0300
Message-ID: <2142150.nOzfK74FZR@wasted.cogentembedded.com>
References: <1625400.M0MxPQybIy@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1625400.M0MxPQybIy-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the EtherAVB clock to the R8A7790 device tree.

Based on original patch by Mitsuhiro Kimura <mitsuhiro.kimura.kc-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 arch/arm/boot/dts/r8a7790.dtsi            |    8 +++++---
 include/dt-bindings/clock/r8a7790-clock.h |    1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7790.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
+++ renesas/arch/arm/boot/dts/r8a7790.dtsi
@@ -1193,16 +1193,18 @@
 			compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
 			clocks = <&hp_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
-			         <&zg_clk>, <&p_clk>, <&zs_clk>, <&zs_clk>;
+			         <&zg_clk>, <&p_clk>, <&hp_clk>, <&zs_clk>,
+				 <&zs_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
 				R8A7790_CLK_MLB R8A7790_CLK_VIN3 R8A7790_CLK_VIN2
-				R8A7790_CLK_VIN1 R8A7790_CLK_VIN0 R8A7790_CLK_ETHER
+				R8A7790_CLK_VIN1 R8A7790_CLK_VIN0
+				R8A7790_CLK_ETHER R8A7790_CLK_ETHERAVB
 				R8A7790_CLK_SATA1 R8A7790_CLK_SATA0
 			>;
 			clock-output-names =
 				"mlb", "vin3", "vin2", "vin1", "vin0", "ether",
-				"sata1", "sata0";
+				"etheravb", "sata1", "sata0";
 		};
 		mstp9_clks: mstp9_clks@e6150994 {
 			compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
Index: renesas/include/dt-bindings/clock/r8a7790-clock.h
===================================================================
--- renesas.orig/include/dt-bindings/clock/r8a7790-clock.h
+++ renesas/include/dt-bindings/clock/r8a7790-clock.h
@@ -105,6 +105,7 @@
 #define R8A7790_CLK_VIN2		9
 #define R8A7790_CLK_VIN1		10
 #define R8A7790_CLK_VIN0		11
+#define R8A7790_CLK_ETHERAVB		12
 #define R8A7790_CLK_ETHER		13
 #define R8A7790_CLK_SATA1		14
 #define R8A7790_CLK_SATA0		15

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
