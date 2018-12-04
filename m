From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/5] dt-bindings: clk: meson: add ao slow clock path ids
Date: Tue,  4 Dec 2018 17:53:06 +0100
Message-ID: <20181204165310.20806-2-jbrunet@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the CLKIDs for the slow clock generation path

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/axg-aoclkc.h  | 7 ++++++-
 include/dt-bindings/clock/gxbb-aoclkc.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
index 61955016a55b..8ec4a269c7a6 100644
--- a/include/dt-bindings/clock/axg-aoclkc.h
+++ b/include/dt-bindings/clock/axg-aoclkc.h
@@ -21,6 +21,11 @@
 #define CLKID_AO_SAR_ADC_SEL	8
 #define CLKID_AO_SAR_ADC_DIV	9
 #define CLKID_AO_SAR_ADC_CLK	10
-#define CLKID_AO_ALT_XTAL	11
+#define CLKID_AO_CTS_OSCIN	11
+#define CLKID_AO_32K_PRE	12
+#define CLKID_AO_32K_DIV	13
+#define CLKID_AO_32K_SEL	14
+#define CLKID_AO_32K		15
+#define CLKID_AO_CTS_RTC_OSCIN	16
 
 #endif
diff --git a/include/dt-bindings/clock/gxbb-aoclkc.h b/include/dt-bindings/clock/gxbb-aoclkc.h
index 9d15e2221fdb..ec3b26319fc4 100644
--- a/include/dt-bindings/clock/gxbb-aoclkc.h
+++ b/include/dt-bindings/clock/gxbb-aoclkc.h
@@ -63,5 +63,12 @@
 #define CLKID_AO_UART2		4
 #define CLKID_AO_IR_BLASTER	5
 #define CLKID_AO_CEC_32K	6
+#define CLKID_AO_CTS_OSCIN	7
+#define CLKID_AO_32K_PRE	8
+#define CLKID_AO_32K_DIV	9
+#define CLKID_AO_32K_SEL	10
+#define CLKID_AO_32K		11
+#define CLKID_AO_CTS_RTC_OSCIN	12
+#define CLKID_AO_CLK81		13
 
 #endif
-- 
2.19.1
