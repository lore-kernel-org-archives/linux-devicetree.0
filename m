From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/4] dt-bindings: clk: axg-audio: add g12a support
Date: Fri, 29 Mar 2019 17:06:46 +0100
Message-ID: <20190329160649.31603-2-jbrunet@baylibre.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329160649.31603-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new compatible string and additional clock ids for audio clock
controller of the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index 61777ad24f61..0f777749f4f1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -6,7 +6,8 @@ devices.
 
 Required Properties:
 
-- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D
+- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
+		  "amlogic,g12a-audio-clkc" for G12A.
 - reg		: physical base address of the clock controller and length of
 		  memory mapped region.
 - clocks	: a list of phandle + clock-specifier pairs for the clocks listed
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index eafb0de8466b..75901c636893 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -70,5 +70,15 @@
 #define AUD_CLKID_TDMOUT_A_LRCLK	134
 #define AUD_CLKID_TDMOUT_B_LRCLK	135
 #define AUD_CLKID_TDMOUT_C_LRCLK	136
+#define AUD_CLKID_SPDIFOUT_B		151
+#define AUD_CLKID_SPDIFOUT_B_CLK	152
+#define AUD_CLKID_TDM_MCLK_PAD0		155
+#define AUD_CLKID_TDM_MCLK_PAD1		156
+#define AUD_CLKID_TDM_LRCLK_PAD0	157
+#define AUD_CLKID_TDM_LRCLK_PAD1	158
+#define AUD_CLKID_TDM_LRCLK_PAD2	159
+#define AUD_CLKID_TDM_SCLK_PAD0		160
+#define AUD_CLKID_TDM_SCLK_PAD1		161
+#define AUD_CLKID_TDM_SCLK_PAD2		162
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.20.1
