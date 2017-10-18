From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 2/6] arm64: dts: uniphier: add GPIO controller nodes
Date: Wed, 18 Oct 2017 13:24:33 +0900
Message-ID: <1508300677-23190-3-git-send-email-yamada.masahiro@socionext.com>
References: <1508300677-23190-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508300677-23190-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GPIO controller also acts as an interrupt controller and the
interrupt lines are connected to the AIDET block.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 25 ++++++++++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 19 ++++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 19 ++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index ee4aff5..99f14cc 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -161,6 +161,31 @@
 			};
 		};
 
+		gpio: gpio@55000000 {
+			compatible = "socionext,uniphier-gpio";
+			reg = <0x55000000 0x200>;
+			interrupt-parent = <&aidet>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 0>,
+				      <&pinctrl 43 0 0>,
+				      <&pinctrl 51 0 0>,
+				      <&pinctrl 96 0 0>,
+				      <&pinctrl 160 0 0>,
+				      <&pinctrl 184 0 0>;
+			gpio-ranges-group-names = "gpio_range0",
+						  "gpio_range1",
+						  "gpio_range2",
+						  "gpio_range3",
+						  "gpio_range4",
+						  "gpio_range5";
+			ngpios = <200>;
+			socionext,interrupt-ranges = <0 48 16>, <16 154 5>,
+						     <21 217 3>;
+		};
+
 		i2c0: i2c@58780000 {
 			compatible = "socionext,uniphier-fi2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index a29c279..17c1c92 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -230,6 +230,25 @@
 			};
 		};
 
+		gpio: gpio@55000000 {
+			compatible = "socionext,uniphier-gpio";
+			reg = <0x55000000 0x200>;
+			interrupt-parent = <&aidet>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 0>,
+				      <&pinctrl 96 0 0>,
+				      <&pinctrl 160 0 0>;
+			gpio-ranges-group-names = "gpio_range0",
+						  "gpio_range1",
+						  "gpio_range2";
+			ngpios = <205>;
+			socionext,interrupt-ranges = <0 48 16>, <16 154 5>,
+						     <21 217 3>;
+		};
+
 		i2c0: i2c@58780000 {
 			compatible = "socionext,uniphier-fi2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 384729f..87cb290 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -178,6 +178,25 @@
 			clocks = <&peri_clk 3>;
 		};
 
+		gpio: gpio@55000000 {
+			compatible = "socionext,uniphier-gpio";
+			reg = <0x55000000 0x200>;
+			interrupt-parent = <&aidet>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 0>,
+				      <&pinctrl 96 0 0>,
+				      <&pinctrl 160 0 0>;
+			gpio-ranges-group-names = "gpio_range0",
+						  "gpio_range1",
+						  "gpio_range2";
+			ngpios = <286>;
+			socionext,interrupt-ranges = <0 48 16>, <16 154 5>,
+						     <21 217 3>;
+		};
+
 		i2c0: i2c@58780000 {
 			compatible = "socionext,uniphier-fi2c";
 			status = "disabled";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
