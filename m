From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 8/8] dt-bindings: clock: gxbb: expose spdif master clock
Date: Fri, 31 Mar 2017 15:04:11 +0200
Message-ID: <20170331130411.4781-9-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Expose the spdif master clock and the mux to select the appropriate spdif
clock parent depending on the data source.

Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 4 ++--
 include/dt-bindings/clock/gxbb-clkc.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 742bc3b42565..17c6aef033ff 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -280,10 +280,10 @@
 /* CLKID_CTS_AMCLK */
 #define CLKID_CTS_AMCLK_SEL	  108
 #define CLKID_CTS_AMCLK_DIV	  109
-#define CLKID_CTS_MCLK_I958	  110
+/* CLKID_CTS_MCLK_I958 */
 #define CLKID_CTS_MCLK_I958_SEL	  111
 #define CLKID_CTS_MCLK_I958_DIV	  112
-#define CLKID_CTS_I958		  113
+/* CLKID_CTS_I958 */
 
 #define NR_CLKS			  114
 
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 0d231bef92e0..4516bc4253b5 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -44,5 +44,7 @@
 #define CLKID_MALI_1		105
 #define CLKID_MALI		106
 #define CLKID_CTS_AMCLK		107
+#define CLKID_CTS_MCLK_I958	110
+#define CLKID_CTS_I958		113
 
 #endif /* __GXBB_CLKC_H */
-- 
2.9.3
