From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/8] dt-bindings: clock: gxbb: expose spdif clock gates
Date: Fri, 31 Mar 2017 15:04:04 +0200
Message-ID: <20170331130411.4781-2-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331130411.4781-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Expose the clock gates required for the spdif output

Acked-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
