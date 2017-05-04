From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] clk: meson-gxbb: un-export the CPU clock
Date: Thu,  4 May 2017 20:19:19 +0200
Message-ID: <20170504181920.21880-2-martin.blumenstingl@googlemail.com>
References: <20170401125519.7339-1-martin.blumenstingl@googlemail.com>
 <20170504181920.21880-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170504181920.21880-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, narmstrong@baylibre.com, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, sboyd@codeaurora.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The CPU clock defined in the Meson GX clock driver is actually a
left-over from the Meson8b clock controller. Un-export the clock so we
can remove it from the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.h              | 2 +-
 include/dt-bindings/clock/gxbb-clkc.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 3e5f375af7b6..c15bbce8c585 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -171,7 +171,7 @@
  * to be exposed to client nodes in DT: include/dt-bindings/clock/gxbb-clkc.h
  */
 #define CLKID_SYS_PLL		  0
-/* CLKID_CPUCLK */
+#define CLKID_CPUCLK		  1
 /* CLKID_HDMI_PLL */
 #define CLKID_FIXED_PLL		  3
 /* CLKID_FCLK_DIV2 */
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 3190e30b9398..46ff81fbc02e 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -5,7 +5,6 @@
 #ifndef __GXBB_CLKC_H
 #define __GXBB_CLKC_H
 
-#define CLKID_CPUCLK		1
 #define CLKID_HDMI_PLL		2
 #define CLKID_FCLK_DIV2		4
 #define CLKID_FCLK_DIV3		5
-- 
2.12.2

