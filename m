From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH v2] ARM: sun7i: dt: Add pll3 and pll7 clocks
Date: Thu,  5 May 2016 20:39:04 +0300
Message-ID: <1462469944-27915-1-git-send-email-plaes@plaes.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable pll3 and pll7 clocks that are needed by display clocks.

Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
---
v2:
 - Fix typos in clocks property (spotted by Alexander Syring)
 - Fix indentation (spotted by Maxime Ripard)

 arch/arm/boot/dts/sun7i-a20.dtsi | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index bf5d056..febdf4c 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -187,6 +187,15 @@
 			clock-output-names = "osc24M";
 		};
 
+		osc3M: osc3M_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clock-div = <8>;
+			clock-mult = <1>;
+			clocks = <&osc24M>;
+			clock-output-names = "osc3M";
+		};
+
 		osc32k: clk@0 {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -211,6 +220,22 @@
 					     "pll2-4x", "pll2-8x";
 		};
 
+		pll3: clk@01c20010 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-pll3-clk";
+			reg = <0x01c20010 0x4>;
+			clocks = <&osc3M>;
+			clock-output-names = "pll3";
+		};
+
+		pll3x2: pll3x2_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clock-div = <1>;
+			clock-mult = <2>;
+			clock-output-names = "pll3-2x";
+		};
+
 		pll4: clk@01c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-pll4-clk";
@@ -236,6 +261,22 @@
 					     "pll6_div_4";
 		};
 
+		pll7: clk@01c20030 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-pll3-clk";
+			reg = <0x01c20030 0x4>;
+			clocks = <&osc3M>;
+			clock-output-names = "pll7";
+		};
+
+		pll7x2: pll7x2_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clock-div = <1>;
+			clock-mult = <2>;
+			clock-output-names = "pll7-2x";
+		};
+
 		pll8: clk@01c20040 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-pll4-clk";
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
