From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
Date: Mon,  4 Mar 2019 11:53:58 +0100
Message-ID: <20190304105358.4987-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When submitted v2 of the G12A AO-CLK IDs, the SAR_ADC_SEL ID was moved
to the internal non-exported bindings, but this clock is necessary and
mandatory for the SAR ADC bindings.

Export it back to the public bindings.

Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a-aoclk.h          | 1 -
 include/dt-bindings/clock/g12a-aoclkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 04b0d5506641..666b4493822c 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -16,7 +16,6 @@
  * to expose, such as the internal muxes and dividers of composite clocks,
  * will remain defined here.
  */
-#define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_DIV	17
 #define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K_PRE	20
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index 8db01ffbeb06..5ac66a2eee0f 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -26,6 +26,7 @@
 #define CLKID_AO_M4_FCLK	13
 #define CLKID_AO_M4_HCLK	14
 #define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
 #define CLKID_AO_32K		23
 #define CLKID_AO_CEC		27
-- 
2.20.1
