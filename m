From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] ARM: sunxi: Add the missing clocks to the pinctrl nodes
Date: Wed, 19 Oct 2016 11:15:27 +0200
Message-ID: <8e58bedc1d25f7fe94497d6ac123f3d4bbfd4c69.1476868462.git-series.maxime.ripard@free-electrons.com>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pin controllers also use the two oscillators for debouncing. Add them
to the DTs.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi     | 3 ++-
 arch/arm/boot/dts/sun5i.dtsi         | 3 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi     | 3 ++-
 arch/arm/boot/dts/sun7i-a20.dtsi     | 3 ++-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 3 ++-
 arch/arm/boot/dts/sun8i-h3.dtsi      | 3 ++-
 arch/arm/boot/dts/sun9i-a80.dtsi     | 3 ++-
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 7e7dfc2b43db..b14a4281058d 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -967,7 +967,8 @@
 			compatible = "allwinner,sun4i-a10-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <28>;
-			clocks = <&apb0_gates 5>;
+			clocks = <&apb0_gates 5>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index e374f4fc8073..485cdbae2b68 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -547,7 +547,8 @@
 		pio: pinctrl@01c20800 {
 			reg = <0x01c20800 0x400>;
 			interrupts = <28>;
-			clocks = <&apb0_gates 5>;
+			clocks = <&apb0_gates 5>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index c1b891e75f18..efd61c65fd19 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -428,7 +428,8 @@
 				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1_PIO>;
+			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 94cf5a1c7172..f7db067b0de0 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1085,7 +1085,8 @@
 			compatible = "allwinner,sun7i-a20-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 5>;
+			clocks = <&apb0_gates 5>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 48fc24f36fcb..b0b6e9ba2501 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -266,7 +266,8 @@
 			/* compatible gets set in SoC specific dtsi file */
 			reg = <0x01c20800 0x400>;
 			/* interrupts get set in SoC specific dtsi file */
-			clocks = <&ccu CLK_BUS_PIO>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 75a865406d3e..afca4da26167 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -321,7 +321,8 @@
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 3c5214cbe4e6..6f8fea2d4808 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -678,7 +678,8 @@
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 5>;
+			clocks = <&apb0_gates 5>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
-- 
git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
