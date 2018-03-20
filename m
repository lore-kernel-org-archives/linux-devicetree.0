From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH v2 2/2] ARM: dts: uniphier: add syscon property for UniPhier sound system
Date: Tue, 20 Mar 2018 11:48:24 +0900
Message-ID: <20180320024824.28902-2-suzuki.katsuhiro@socionext.com>
References: <20180320024824.28902-1-suzuki.katsuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320024824.28902-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

This patch adds syscon property for specifying soc-glue core into
device-tree of PXs2 SoC.

Currently, soc-glue core is used for changing the state of S/PDIF
signal output pin to signal output state or Hi-Z state.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 arch/arm/boot/dts/uniphier-pxs2.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 595045441c9c..debcbd15c24b 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -242,6 +242,7 @@
 			reset-names = "aio";
 			resets = <&sys_rst 40>;
 			#sound-dai-cells = <1>;
+			socionext,syscon = <&soc_glue>;
 
 			i2s_port0: port@0 {
 				i2s_hdmi: endpoint {
@@ -418,7 +419,7 @@
 			};
 		};
 
-		soc-glue@5f800000 {
+		soc_glue: soc-glue@5f800000 {
 			compatible = "socionext,uniphier-pxs2-soc-glue",
 				     "simple-mfd", "syscon";
 			reg = <0x5f800000 0x2000>;
-- 
2.16.2
