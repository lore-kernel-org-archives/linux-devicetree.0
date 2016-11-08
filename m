From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 2/2] ARM: sunxi: Add the missing clocks to the pinctrl nodes
Date: Tue,  8 Nov 2016 21:24:01 +0100
Message-ID: <dbf6796cb2857e09072d57dc29152c153c2c8f61.1478636546.git-series.maxime.ripard@free-electrons.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The pin controllers also use the two oscillators for debouncing. Add them
to the DTs.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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
index 2e8bf93dcfb2..d06dcd1bc5a9 100644
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
index 300a1bd5a6ec..dc57b0df2f52 100644
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
index c38b028cac83..98d1c079e2aa 100644
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
index ab6a221027ef..025efba21ce0 100644
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
git-series 0.8.11
