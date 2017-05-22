From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: meson-gxbb: Expose SPICC gate
Date: Mon, 22 May 2017 14:48:46 +0200
Message-ID: <1495457326-32659-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 2 +-
 include/dt-bindings/clock/gxbb-clkc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 93b8f07..cc7b35c 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -191,7 +191,7 @@
 #define CLKID_ISA		  18
 #define CLKID_PL301		  19
 #define CLKID_PERIPHS		  20
-#define CLKID_SPICC		  21
+/* CLKID_SPICC */
 /* CLKID_I2C */
 /* #define CLKID_SAR_ADC */
 #define CLKID_SMART_CARD	  24
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 3190e30..88da194 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -13,6 +13,7 @@
 #define CLKID_GP0_PLL		9
 #define CLKID_CLK81		12
 #define CLKID_MPLL2		15
+#define CLKID_SPICC		21
 #define CLKID_I2C		22
 #define CLKID_SAR_ADC		23
 #define CLKID_RNG0		25
-- 
1.9.1

