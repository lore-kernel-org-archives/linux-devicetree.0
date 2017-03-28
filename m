From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v1 1/8] dt-bindings: clock: gxbb: expose spdif clock gates
Date: Tue, 28 Mar 2017 16:45:58 +0200
Message-ID: <20170328144605.25278-2-jbrunet@baylibre.com>
References: <20170328144605.25278-1-jbrunet@baylibre.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170328144605.25278-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Expose the clock gates required for the spdif output

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 4 ++--
 include/dt-bindings/clock/gxbb-clkc.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 9d949244b104..0d535f7e7aed 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -209,7 +209,7 @@
 /* CLKID_ETH */
 #define CLKID_DEMUX		  37
 /* CLKID_AIU_GLUE */
-#define CLKID_IEC958		  39
+/* CLKID_IEC958 */
 /* CLKID_I2S_OUT */
 #define CLKID_AMCLK		  41
 #define CLKID_AIFIFO2		  42
@@ -251,7 +251,7 @@
 #define CLKID_GCLK_VENCI_INT	  78
 #define CLKID_DAC_CLK		  79
 /* CLKID_AOCLK_GATE */
-#define CLKID_IEC958_GATE	  81
+/* CLKID_IEC958_GATE */
 #define CLKID_ENC480P		  82
 #define CLKID_RNG1		  83
 #define CLKID_GCLK_VENCI_INT1	  84
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index cce6cb5418f1..1d4614bc8154 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -18,6 +18,7 @@
 #define CLKID_SAR_ADC		23
 #define CLKID_ETH		36
 #define CLKID_AIU_GLUE		38
+#define CLKID_IEC958		39
 #define CLKID_I2S_OUT		40
 #define CLKID_MIXER_IFACE	44
 #define CLKID_AIU		47
@@ -30,6 +31,7 @@
 #define CLKID_SANA		69
 #define CLKID_GCLK_VENCI_INT0	77
 #define CLKID_AOCLK_GATE	80
+#define CLKID_IEC958_GATE	81
 #define CLKID_AO_I2C		93
 #define CLKID_SD_EMMC_A		94
 #define CLKID_SD_EMMC_B		95
-- 
2.9.3

