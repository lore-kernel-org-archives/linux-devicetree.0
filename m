From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: mediatek: audsys: add support for MT8516
Date: Thu,  2 May 2019 14:18:42 +0200
Message-ID: <20190502121843.14493-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, wenzhen.yu@mediatek.com, sean.wang@mediatek.com, ryder.lee@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add AUDSYS device tree bindings documentation for MediaTek MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.txt   |  1 +
 include/dt-bindings/clock/mt8516-clk.h          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index d1606b2c3e63..a4d07108bd4c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt7622-audsys", "syscon"
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
+	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
 
 The AUDSYS controller uses the common clk binding from
diff --git a/include/dt-bindings/clock/mt8516-clk.h b/include/dt-bindings/clock/mt8516-clk.h
index 9cfca53cd78d..816447b98edd 100644
--- a/include/dt-bindings/clock/mt8516-clk.h
+++ b/include/dt-bindings/clock/mt8516-clk.h
@@ -208,4 +208,21 @@
 #define CLK_TOP_MSDC2_INFRA		176
 #define CLK_TOP_NR_CLK			177
 
+/* AUDSYS */
+
+#define CLK_AUD_AFE			0
+#define CLK_AUD_I2S			1
+#define CLK_AUD_22M			2
+#define CLK_AUD_24M			3
+#define CLK_AUD_INTDIR			4
+#define CLK_AUD_APLL2_TUNER		5
+#define CLK_AUD_APLL_TUNER		6
+#define CLK_AUD_HDMI			7
+#define CLK_AUD_SPDF			8
+#define CLK_AUD_ADC			9
+#define CLK_AUD_DAC			10
+#define CLK_AUD_DAC_PREDIS		11
+#define CLK_AUD_TML			12
+#define CLK_AUD_NR_CLK			13
+
 #endif /* _DT_BINDINGS_CLK_MT8516_H */
-- 
2.20.1
