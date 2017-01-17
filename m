From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] clk: meson-gxbb: Export HDMI clocks
Date: Tue, 17 Jan 2017 13:08:48 +0100
Message-ID: <1484654928-5640-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Export HDMI clock from internal to dt-bindings.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/clk/meson/gxbb.h              | 4 ++--
 include/dt-bindings/clock/gxbb-clkc.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 0252939..2139e97 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -231,7 +231,7 @@
 #define CLKID_AHB_DATA_BUS	  60
 #define CLKID_AHB_CTRL_BUS	  61
 #define CLKID_HDMI_INTR_SYNC	  62
-#define CLKID_HDMI_PCLK		  63
+/* CLKID_HDMI_PCLK */
 /* CLKID_USB1_DDR_BRIDGE */
 /* CLKID_USB0_DDR_BRIDGE */
 #define CLKID_MMC_PCLK		  66
@@ -245,7 +245,7 @@
 #define CLKID_VCLK2_VENCI1	  74
 #define CLKID_VCLK2_VENCP0	  75
 #define CLKID_VCLK2_VENCP1	  76
-#define CLKID_GCLK_VENCI_INT0	  77
+/* CLKID_GCLK_VENCI_INT0 */
 #define CLKID_GCLK_VENCI_INT	  78
 #define CLKID_DAC_CLK		  79
 #define CLKID_AOCLK_GATE	  80
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index baade6f..da1d473 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -18,8 +18,10 @@
 #define CLKID_USB0		50
 #define CLKID_USB1		51
 #define CLKID_USB		55
+#define CLKID_HDMI_PCLK		63
 #define CLKID_USB1_DDR_BRIDGE	64
 #define CLKID_USB0_DDR_BRIDGE	65
+#define CLKID_GCLK_VENCI_INT0	77
 #define CLKID_AO_I2C		93
 #define CLKID_SD_EMMC_A		94
 #define CLKID_SD_EMMC_B		95
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
