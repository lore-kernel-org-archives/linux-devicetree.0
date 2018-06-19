From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: fix widget name of headphone for LD11/LD20 boards
Date: Tue, 19 Jun 2018 13:12:05 +0900
Message-ID: <20180619041205.6720-1-suzuki.katsuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

This patch fixes wrong name of headphone widget for receiving events
of insert/remove headphone plug from simple-card or audio-graph-card.

If we use wrong widget name then we get warning messages such as
"asoc-audio-graph-card sound: ASoC: DAPM unknown pin Headphones"
when the plug is inserted or removed from headphone jack.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
index e5bda40b3ec6..7cc3f6dd93d9 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
@@ -54,7 +54,7 @@
 	sound {
 		compatible = "audio-graph-card";
 		label = "UniPhier LD11";
-		widgets = "Headphone", "Headphone Jack";
+		widgets = "Headphone", "Headphones";
 		dais = <&i2s_port2
 			&i2s_port3
 			&i2s_port4
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index 38b75998e2dd..575be4ab0072 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -54,7 +54,7 @@
 	sound {
 		compatible = "audio-graph-card";
 		label = "UniPhier LD20";
-		widgets = "Headphone", "Headphone Jack";
+		widgets = "Headphone", "Headphones";
 		dais = <&i2s_port2
 			&i2s_port3
 			&i2s_port4
-- 
2.17.1
