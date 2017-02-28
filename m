From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 7/7] dt-bindings: clk: gxbb: expose i2s output clock gates
Date: Tue, 28 Feb 2017 14:30:02 +0100
Message-ID: <20170228133002.17894-8-jbrunet@baylibre.com>
References: <20170228133002.17894-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228133002.17894-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 10 +++++-----
 include/dt-bindings/clock/gxbb-clkc.h |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index dc487180f847..95a83b7709ca 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -206,16 +206,16 @@
 #define CLKID_I2S_SPDIF		  35
 #define CLKID_ETH		  36
 #define CLKID_DEMUX		  37
-#define CLKID_AIU_GLUE		  38
+/* CLKID_AIU_GLUE */
 #define CLKID_IEC958		  39
-#define CLKID_I2S_OUT		  40
+/* CLKID_I2S_OUT */
 #define CLKID_AMCLK		  41
 #define CLKID_AIFIFO2		  42
 #define CLKID_MIXER		  43
-#define CLKID_MIXER_IFACE	  44
+/* CLKID_MIXER_IFACE */
 #define CLKID_ADC		  45
 #define CLKID_BLKMV		  46
-#define CLKID_AIU		  47
+/* CLKID_AIU */
 #define CLKID_UART1		  48
 #define CLKID_G2D		  49
 /* CLKID_USB0 */
@@ -248,7 +248,7 @@
 /* CLKID_GCLK_VENCI_INT0 */
 #define CLKID_GCLK_VENCI_INT	  78
 #define CLKID_DAC_CLK		  79
-#define CLKID_AOCLK_GATE	  80
+/* CLKID_AOCLK_GATE */
 #define CLKID_IEC958_GATE	  81
 #define CLKID_ENC480P		  82
 #define CLKID_RNG1		  83
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 692846c7941b..f08f06dd7702 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -16,6 +16,10 @@
 #define CLKID_I2C		22
 #define CLKID_SAR_ADC		23
 #define CLKID_ETH		36
+#define CLKID_AIU_GLUE		38
+#define CLKID_I2S_OUT		40
+#define CLKID_MIXER_IFACE	44
+#define CLKID_AIU		47
 #define CLKID_USB0		50
 #define CLKID_USB1		51
 #define CLKID_USB		55
@@ -24,6 +28,7 @@
 #define CLKID_USB0_DDR_BRIDGE	65
 #define CLKID_SANA		69
 #define CLKID_GCLK_VENCI_INT0	77
+#define CLKID_AOCLK_GATE	80
 #define CLKID_AO_I2C		93
 #define CLKID_SD_EMMC_A		94
 #define CLKID_SD_EMMC_B		95
-- 
2.9.3
