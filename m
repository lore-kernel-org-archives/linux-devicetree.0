From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: add syscon property for UniPhier sound system
Date: Mon, 19 Mar 2018 10:21:58 +0900
Message-ID: <20180319012158.26411-1-suzuki.katsuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

This patch adds syscon property for specifying soc-glue core into
device-tree of LD11/LD20 SoC.

Currently, soc-glue core is used for changing the state of S/PDIF
signal output pin to signal output state or Hi-Z state.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 arch/arm/boot/dts/uniphier-pxs2.dtsi             | 4 +++-
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 4 +++-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 595045441c9c..c72c0a123c87 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -243,6 +243,8 @@
 			resets = <&sys_rst 40>;
 			#sound-dai-cells = <1>;
 
+			socionext,syscon = <&sg>;
+
 			i2s_port0: port@0 {
 				i2s_hdmi: endpoint {
 				};
@@ -418,7 +420,7 @@
 			};
 		};
 
-		soc-glue@5f800000 {
+		sg: soc-glue@5f800000 {
 			compatible = "socionext,uniphier-pxs2-soc-glue",
 				     "simple-mfd", "syscon";
 			reg = <0x5f800000 0x2000>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index efa95573b2aa..5a1b8d574904 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -198,6 +198,8 @@
 			resets = <&sys_rst 40>;
 			#sound-dai-cells = <1>;
 
+			socionext,syscon = <&sg>;
+
 			i2s_port0: port@0 {
 				i2s_hdmi: endpoint {
 				};
@@ -479,7 +481,7 @@
 			};
 		};
 
-		soc-glue@5f800000 {
+		sg: soc-glue@5f800000 {
 			compatible = "socionext,uniphier-ld11-soc-glue",
 				     "simple-mfd", "syscon";
 			reg = <0x5f800000 0x2000>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 19c935688a77..831522444276 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -298,6 +298,8 @@
 			resets = <&sys_rst 40>;
 			#sound-dai-cells = <1>;
 
+			socionext,syscon = <&sg>;
+
 			i2s_port0: port@0 {
 				i2s_hdmi: endpoint {
 				};
@@ -525,7 +527,7 @@
 			cdns,phy-dll-delay-sdclk-hsmmc = <21>;
 		};
 
-		soc-glue@5f800000 {
+		sg: soc-glue@5f800000 {
 			compatible = "socionext,uniphier-ld20-soc-glue",
 				     "simple-mfd", "syscon";
 			reg = <0x5f800000 0x2000>;
-- 
2.16.2
