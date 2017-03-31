From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 7/8] dt-bindings: clock: gxbb: expose i2s master clock
Date: Fri, 31 Mar 2017 15:04:10 +0200
Message-ID: <20170331130411.4781-8-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Expose cts_amclk in the device tree bindings

Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 2 +-
 include/dt-bindings/clock/gxbb-clkc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 3b0665099a1e..742bc3b42565 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -277,7 +277,7 @@
 #define CLKID_MALI_1_DIV	 104
 /* CLKID_MALI_1	*/
 /* CLKID_MALI	*/
-#define CLKID_CTS_AMCLK		  107
+/* CLKID_CTS_AMCLK */
 #define CLKID_CTS_AMCLK_SEL	  108
 #define CLKID_CTS_AMCLK_DIV	  109
 #define CLKID_CTS_MCLK_I958	  110
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 1d4614bc8154..0d231bef92e0 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -43,5 +43,6 @@
 #define CLKID_MALI_1_SEL	103
 #define CLKID_MALI_1		105
 #define CLKID_MALI		106
+#define CLKID_CTS_AMCLK		107
 
 #endif /* __GXBB_CLKC_H */
-- 
2.9.3
