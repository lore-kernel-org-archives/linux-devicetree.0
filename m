From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/2] reset: dt-bindings: meson: update arb bindings for sm1
Date: Thu,  5 Sep 2019 15:50:39 +0200
Message-ID: <20190905135040.6635-2-jbrunet@baylibre.com>
References: <20190905135040.6635-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905135040.6635-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

SM1 SoC family adds two new audio FIFOs with the related arb reset lines

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt  | 3 ++-
 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h        | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
index 26e542eb96df..43e580ef64ba 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
@@ -4,7 +4,8 @@ The Amlogic Audio ARB is a simple device which enables or
 disables the access of Audio FIFOs to DDR on AXG based SoC.
 
 Required properties:
-- compatible: 'amlogic,meson-axg-audio-arb'
+- compatible: 'amlogic,meson-axg-audio-arb' or
+	      'amlogic,meson-sm1-audio-arb'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: phandle to the fifo peripheral clock provided by the audio
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
index 05c36367875c..1ef807856cb8 100644
--- a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
+++ b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
@@ -13,5 +13,7 @@
 #define AXG_ARB_FRDDR_A	3
 #define AXG_ARB_FRDDR_B	4
 #define AXG_ARB_FRDDR_C	5
+#define AXG_ARB_TODDR_D	6
+#define AXG_ARB_FRDDR_D	7
 
 #endif /* _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H */
-- 
2.21.0
