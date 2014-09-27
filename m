From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 3/7] ARM: sun6i: DT: Add PLL6 multiple outputs
Date: Sat, 27 Sep 2014 16:49:51 +0800
Message-ID: <1411807795-6575-4-git-send-email-wens@csie.org>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411807795-6575-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

PLL6 on sun6i has multiple outputs, just like the other sunxi platforms.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 543f895..9ac1dd3 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -132,11 +132,11 @@
 		};
 
 		pll6: clk@01c20028 {
-			#clock-cells = <0>;
+			#clock-cells = <1>;
 			compatible = "allwinner,sun6i-a31-pll6-clk";
 			reg = <0x01c20028 0x4>;
 			clocks = <&osc24M>;
-			clock-output-names = "pll6";
+			clock-output-names = "pll6", "pll6x2";
 		};
 
 		cpu: cpu@01c20050 {
@@ -166,7 +166,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun6i-a31-ahb1-mux-clk";
 			reg = <0x01c20054 0x4>;
-			clocks = <&osc32k>, <&osc24M>, <&axi>, <&pll6>;
+			clocks = <&osc32k>, <&osc24M>, <&axi>, <&pll6 0>;
 			clock-output-names = "ahb1_mux";
 		};
 
@@ -221,7 +221,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-apb1-mux-clk";
 			reg = <0x01c20058 0x4>;
-			clocks = <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;
+			clocks = <&osc32k>, <&osc24M>, <&pll6 0>, <&pll6 0>;
 			clock-output-names = "apb2_mux";
 		};
 
@@ -248,7 +248,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20088 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "mmc0";
 		};
 
@@ -256,7 +256,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c2008c 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "mmc1";
 		};
 
@@ -264,7 +264,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20090 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "mmc2";
 		};
 
@@ -272,7 +272,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20094 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "mmc3";
 		};
 
@@ -280,7 +280,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a0 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "spi0";
 		};
 
@@ -288,7 +288,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a4 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "spi1";
 		};
 
@@ -296,7 +296,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a8 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "spi2";
 		};
 
@@ -304,7 +304,7 @@
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200ac 0x4>;
-			clocks = <&osc24M>, <&pll6>;
+			clocks = <&osc24M>, <&pll6 0>;
 			clock-output-names = "spi3";
 		};
 
@@ -840,7 +840,7 @@
 			ar100: ar100_clk {
 				compatible = "allwinner,sun6i-a31-ar100-clk";
 				#clock-cells = <0>;
-				clocks = <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;
+				clocks = <&osc32k>, <&osc24M>, <&pll6 0>, <&pll6 0>;
 				clock-output-names = "ar100";
 			};
 
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
