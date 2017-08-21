From: Katsuhiro Suzuki <suzuki.katsuhiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] arm64: dts: uniphier: add reset controller node of analog amplifier
Date: Mon, 21 Aug 2017 20:55:04 +0900
Message-ID: <20170821115504.27276-1-suzuki.katsuhiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Katsuhiro Suzuki <suzuki.katsuhiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds reset controller node of analog signal amplifier
core (ADAMV) for UniPhier LD11/LD20 SoCs.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index bdce5b89baec..35ffea71bc55 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -150,6 +150,17 @@
 			clocks = <&peri_clk 3>;
 		};
 
+		adamv@57920000 {
+			compatible = "socionext,uniphier-ld11-adamv",
+				     "simple-mfd", "syscon";
+			reg = <0x57920000 0x1000>;
+
+			adamv_rst: reset {
+				compatible = "socionext,uniphier-ld11-adamv-reset";
+				#reset-cells = <1>;
+			};
+		};
+
 		i2c0: i2c@58780000 {
 			compatible = "socionext,uniphier-fi2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index de1e75362817..b21b8bf523ff 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -219,6 +219,17 @@
 			clocks = <&peri_clk 3>;
 		};
 
+		adamv@57920000 {
+			compatible = "socionext,uniphier-ld20-adamv",
+				     "simple-mfd", "syscon";
+			reg = <0x57920000 0x1000>;
+
+			adamv_rst: reset {
+				compatible = "socionext,uniphier-ld20-adamv-reset";
+				#reset-cells = <1>;
+			};
+		};
+
 		i2c0: i2c@58780000 {
 			compatible = "socionext,uniphier-fi2c";
 			status = "disabled";
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
