From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 2/2] ARM: sunxi: Add the missing clocks to the pinctrl nodes
Date: Mon, 14 Nov 2016 21:53:04 +0100
Message-ID: <8ee1716a6e61159f91e523fda060d366dac279d4.1479156725.git-series.maxime.ripard@free-electrons.com>
References: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pin controllers also use the two oscillators for debouncing. Add them
to the DTs.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi     | 3 ++-
 arch/arm/boot/dts/sun5i.dtsi         | 3 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi     | 6 ++++--
 arch/arm/boot/dts/sun7i-a20.dtsi     | 3 ++-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 6 ++++--
 arch/arm/boot/dts/sun8i-h3.dtsi      | 6 ++++--
 arch/arm/boot/dts/sun9i-a80.dtsi     | 6 ++++--
 7 files changed, 22 insertions(+), 11 deletions(-)

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
index b4ccee8cfb02..b0fca4ef4dae 100644
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
index 2e8bf93dcfb2..c941662383ee 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -471,7 +471,8 @@
 				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1_PIO>;
+			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -1051,7 +1052,8 @@
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			resets = <&apb0_rst 0>;
 			gpio-controller;
 			interrupt-controller;
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
index 300a1bd5a6ec..e4991a78ad73 100644
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
@@ -575,7 +576,8 @@
 			compatible = "allwinner,sun8i-a23-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			resets = <&apb0_rst 0>;
 			gpio-controller;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index c38b028cac83..3c6596f06ebc 100644
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
@@ -614,7 +615,8 @@
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			resets = <&apb0_reset 0>;
 			gpio-controller;
 			#gpio-cells = <3>;
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index ab6a221027ef..979ad1aacfb1 100644
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
@@ -902,7 +903,8 @@
 			reg = <0x08002c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apbs_gates 0>;
+			clocks = <&apbs_gates 0>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
 			resets = <&apbs_rst 0>;
 			gpio-controller;
 			interrupt-controller;
-- 
git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
