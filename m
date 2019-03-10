From: Eric Nelson <eric@nelint.com>
Subject: [PATCH] clk: imx6q: remove unsupported pll4_audio_div
Date: Sun, 10 Mar 2019 16:18:50 -0700
Message-ID: <1552259930-27786-1-git-send-email-eric@nelint.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, clement.peron@devialet.com, colin.didier@devialet.com, devicetree@vger.kernel.org, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com, Eric Nelson <eric@nelint.com>
List-Id: devicetree@vger.kernel.org

The pll4_audio_div attempted to reflect one bit of a two-bit
divisor (AUDIO_DIV_LSB) in the CCM_ANALOG_MISC2 register.

Unfortunately, this divisor is non-functional at least on the
latest silicon revisions and has been removed from the reference
manual.

This is discussed in this NXP Community thread:

    https://community.nxp.com/thread/462806

Remove the definition of pll4_audio_div to reflect this and
reparent the ssi, cko1, and ESAI/ASRC/SPDIF clocks to the
pll4_post_div clock.

Signed-off-by: Eric Nelson <eric@nelint.com>
---
 drivers/clk/imx/clk-imx6q.c               |   7 +-
 include/dt-bindings/clock/imx6qdl-clock.h | 127 +++++++++++++++---------------
 2 files changed, 66 insertions(+), 68 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index 708e7c5..56d6ebb 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -32,7 +32,7 @@ static const char *periph2_clk2_sels[]	= { "pll3_usb_otg", "pll2_bus", };
 static const char *periph_sels[]	= { "periph_pre", "periph_clk2", };
 static const char *periph2_sels[]	= { "periph2_pre", "periph2_clk2", };
 static const char *axi_sels[]		= { "periph", "pll2_pfd2_396m", "periph", "pll3_pfd1_540m", };
-static const char *audio_sels[]	= { "pll4_audio_div", "pll3_pfd2_508m", "pll3_pfd3_454m", "pll3_usb_otg", };
+static const char *audio_sels[]	= { "pll4_post_div", "pll3_pfd2_508m", "pll3_pfd3_454m", "pll3_usb_otg", };
 static const char *gpu_axi_sels[]	= { "axi", "ahb", };
 static const char *pre_axi_sels[]	= { "axi", "ahb", };
 static const char *gpu2d_core_sels[]	= { "axi", "pll3_usb_otg", "pll2_pfd0_352m", "pll2_pfd2_396m", };
@@ -52,7 +52,7 @@ static const char *ipu2_di0_sels_2[]	= { "ipu2_di0_pre", "dummy", "dummy", "ldb_
 static const char *ipu2_di1_sels_2[]	= { "ipu2_di1_pre", "dummy", "dummy", "ldb_di0_podf", "ldb_di1_podf", };
 static const char *hsi_tx_sels[]	= { "pll3_120m", "pll2_pfd2_396m", };
 static const char *pcie_axi_sels[]	= { "axi", "ahb", };
-static const char *ssi_sels[]		= { "pll3_pfd2_508m", "pll3_pfd3_454m", "pll4_audio_div", };
+static const char *ssi_sels[]		= { "pll3_pfd2_508m", "pll3_pfd3_454m", "pll4_post_div", };
 static const char *usdhc_sels[]	= { "pll2_pfd2_396m", "pll2_pfd0_352m", };
 static const char *enfc_sels[]	= { "pll2_pfd0_352m", "pll2_bus", "pll3_usb_otg", "pll2_pfd2_396m", };
 static const char *enfc_sels_2[] = {"pll2_pfd0_352m", "pll2_bus", "pll3_usb_otg", "pll2_pfd2_396m", "pll3_pfd3_454m", "dummy", };
@@ -66,7 +66,7 @@ static const char *ecspi_sels[] = { "pll3_60m", "osc", };
 static const char *can_sels[] = { "pll3_60m", "osc", "pll3_80m", };
 static const char *cko1_sels[]	= { "pll3_usb_otg", "pll2_bus", "pll1_sys", "pll5_video_div",
 				    "video_27m", "axi", "enfc", "ipu1_di0", "ipu1_di1", "ipu2_di0",
-				    "ipu2_di1", "ahb", "ipg", "ipg_per", "ckil", "pll4_audio_div", };
+				    "ipu2_di1", "ahb", "ipg", "ipg_per", "ckil", "pll4_post_div", };
 static const char *cko2_sels[] = {
 	"mmdc_ch0_axi", "mmdc_ch1_axi", "usdhc4", "usdhc1",
 	"gpu2d_axi", "dummy", "ecspi_root", "gpu3d_axi",
@@ -607,7 +607,6 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	}
 
 	clk[IMX6QDL_CLK_PLL4_POST_DIV] = clk_register_divider_table(NULL, "pll4_post_div", "pll4_audio", CLK_SET_RATE_PARENT, base + 0x70, 19, 2, 0, post_div_table, &imx_ccm_lock);
-	clk[IMX6QDL_CLK_PLL4_AUDIO_DIV] = clk_register_divider(NULL, "pll4_audio_div", "pll4_post_div", CLK_SET_RATE_PARENT, base + 0x170, 15, 1, 0, &imx_ccm_lock);
 	clk[IMX6QDL_CLK_PLL5_POST_DIV] = clk_register_divider_table(NULL, "pll5_post_div", "pll5_video", CLK_SET_RATE_PARENT, base + 0xa0, 19, 2, 0, post_div_table, &imx_ccm_lock);
 	clk[IMX6QDL_CLK_PLL5_VIDEO_DIV] = clk_register_divider_table(NULL, "pll5_video_div", "pll5_post_div", CLK_SET_RATE_PARENT, base + 0x170, 30, 2, 0, video_div_table, &imx_ccm_lock);
 
diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
index b3cef29..dea23a9 100644
--- a/include/dt-bindings/clock/imx6qdl-clock.h
+++ b/include/dt-bindings/clock/imx6qdl-clock.h
@@ -213,69 +213,68 @@
 #define IMX6QDL_CLK_CKO2			200
 #define IMX6QDL_CLK_CKO				201
 #define IMX6QDL_CLK_VDOA			202
-#define IMX6QDL_CLK_PLL4_AUDIO_DIV		203
-#define IMX6QDL_CLK_LVDS1_SEL			204
-#define IMX6QDL_CLK_LVDS2_SEL			205
-#define IMX6QDL_CLK_LVDS1_GATE			206
-#define IMX6QDL_CLK_LVDS2_GATE			207
-#define IMX6QDL_CLK_ESAI_IPG			208
-#define IMX6QDL_CLK_ESAI_MEM			209
-#define IMX6QDL_CLK_ASRC_IPG			210
-#define IMX6QDL_CLK_ASRC_MEM			211
-#define IMX6QDL_CLK_LVDS1_IN			212
-#define IMX6QDL_CLK_LVDS2_IN			213
-#define IMX6QDL_CLK_ANACLK1			214
-#define IMX6QDL_CLK_ANACLK2			215
-#define IMX6QDL_PLL1_BYPASS_SRC			216
-#define IMX6QDL_PLL2_BYPASS_SRC			217
-#define IMX6QDL_PLL3_BYPASS_SRC			218
-#define IMX6QDL_PLL4_BYPASS_SRC			219
-#define IMX6QDL_PLL5_BYPASS_SRC			220
-#define IMX6QDL_PLL6_BYPASS_SRC			221
-#define IMX6QDL_PLL7_BYPASS_SRC			222
-#define IMX6QDL_CLK_PLL1			223
-#define IMX6QDL_CLK_PLL2			224
-#define IMX6QDL_CLK_PLL3			225
-#define IMX6QDL_CLK_PLL4			226
-#define IMX6QDL_CLK_PLL5			227
-#define IMX6QDL_CLK_PLL6			228
-#define IMX6QDL_CLK_PLL7			229
-#define IMX6QDL_PLL1_BYPASS			230
-#define IMX6QDL_PLL2_BYPASS			231
-#define IMX6QDL_PLL3_BYPASS			232
-#define IMX6QDL_PLL4_BYPASS			233
-#define IMX6QDL_PLL5_BYPASS			234
-#define IMX6QDL_PLL6_BYPASS			235
-#define IMX6QDL_PLL7_BYPASS			236
-#define IMX6QDL_CLK_GPT_3M			237
-#define IMX6QDL_CLK_VIDEO_27M			238
-#define IMX6QDL_CLK_MIPI_CORE_CFG		239
-#define IMX6QDL_CLK_MIPI_IPG			240
-#define IMX6QDL_CLK_CAAM_MEM			241
-#define IMX6QDL_CLK_CAAM_ACLK			242
-#define IMX6QDL_CLK_CAAM_IPG			243
-#define IMX6QDL_CLK_SPDIF_GCLK			244
-#define IMX6QDL_CLK_UART_SEL			245
-#define IMX6QDL_CLK_IPG_PER_SEL			246
-#define IMX6QDL_CLK_ECSPI_SEL			247
-#define IMX6QDL_CLK_CAN_SEL			248
-#define IMX6QDL_CLK_MMDC_CH1_AXI_CG		249
-#define IMX6QDL_CLK_PRE0			250
-#define IMX6QDL_CLK_PRE1			251
-#define IMX6QDL_CLK_PRE2			252
-#define IMX6QDL_CLK_PRE3			253
-#define IMX6QDL_CLK_PRG0_AXI			254
-#define IMX6QDL_CLK_PRG1_AXI			255
-#define IMX6QDL_CLK_PRG0_APB			256
-#define IMX6QDL_CLK_PRG1_APB			257
-#define IMX6QDL_CLK_PRE_AXI			258
-#define IMX6QDL_CLK_MLB_SEL			259
-#define IMX6QDL_CLK_MLB_PODF			260
-#define IMX6QDL_CLK_EPIT1			261
-#define IMX6QDL_CLK_EPIT2			262
-#define IMX6QDL_CLK_MMDC_P0_IPG			263
-#define IMX6QDL_CLK_DCIC1			264
-#define IMX6QDL_CLK_DCIC2			265
-#define IMX6QDL_CLK_END				266
+#define IMX6QDL_CLK_LVDS1_SEL			203
+#define IMX6QDL_CLK_LVDS2_SEL			204
+#define IMX6QDL_CLK_LVDS1_GATE			205
+#define IMX6QDL_CLK_LVDS2_GATE			206
+#define IMX6QDL_CLK_ESAI_IPG			207
+#define IMX6QDL_CLK_ESAI_MEM			208
+#define IMX6QDL_CLK_ASRC_IPG			209
+#define IMX6QDL_CLK_ASRC_MEM			210
+#define IMX6QDL_CLK_LVDS1_IN			211
+#define IMX6QDL_CLK_LVDS2_IN			212
+#define IMX6QDL_CLK_ANACLK1			213
+#define IMX6QDL_CLK_ANACLK2			214
+#define IMX6QDL_PLL1_BYPASS_SRC			215
+#define IMX6QDL_PLL2_BYPASS_SRC			216
+#define IMX6QDL_PLL3_BYPASS_SRC			217
+#define IMX6QDL_PLL4_BYPASS_SRC			218
+#define IMX6QDL_PLL5_BYPASS_SRC			219
+#define IMX6QDL_PLL6_BYPASS_SRC			220
+#define IMX6QDL_PLL7_BYPASS_SRC			221
+#define IMX6QDL_CLK_PLL1			222
+#define IMX6QDL_CLK_PLL2			223
+#define IMX6QDL_CLK_PLL3			224
+#define IMX6QDL_CLK_PLL4			225
+#define IMX6QDL_CLK_PLL5			226
+#define IMX6QDL_CLK_PLL6			227
+#define IMX6QDL_CLK_PLL7			228
+#define IMX6QDL_PLL1_BYPASS			229
+#define IMX6QDL_PLL2_BYPASS			230
+#define IMX6QDL_PLL3_BYPASS			231
+#define IMX6QDL_PLL4_BYPASS			232
+#define IMX6QDL_PLL5_BYPASS			233
+#define IMX6QDL_PLL6_BYPASS			234
+#define IMX6QDL_PLL7_BYPASS			235
+#define IMX6QDL_CLK_GPT_3M			236
+#define IMX6QDL_CLK_VIDEO_27M			237
+#define IMX6QDL_CLK_MIPI_CORE_CFG		238
+#define IMX6QDL_CLK_MIPI_IPG			239
+#define IMX6QDL_CLK_CAAM_MEM			240
+#define IMX6QDL_CLK_CAAM_ACLK			241
+#define IMX6QDL_CLK_CAAM_IPG			242
+#define IMX6QDL_CLK_SPDIF_GCLK			243
+#define IMX6QDL_CLK_UART_SEL			244
+#define IMX6QDL_CLK_IPG_PER_SEL			245
+#define IMX6QDL_CLK_ECSPI_SEL			246
+#define IMX6QDL_CLK_CAN_SEL			247
+#define IMX6QDL_CLK_MMDC_CH1_AXI_CG		248
+#define IMX6QDL_CLK_PRE0			249
+#define IMX6QDL_CLK_PRE1			250
+#define IMX6QDL_CLK_PRE2			251
+#define IMX6QDL_CLK_PRE3			252
+#define IMX6QDL_CLK_PRG0_AXI			253
+#define IMX6QDL_CLK_PRG1_AXI			254
+#define IMX6QDL_CLK_PRG0_APB			255
+#define IMX6QDL_CLK_PRG1_APB			256
+#define IMX6QDL_CLK_PRE_AXI			257
+#define IMX6QDL_CLK_MLB_SEL			258
+#define IMX6QDL_CLK_MLB_PODF			259
+#define IMX6QDL_CLK_EPIT1			260
+#define IMX6QDL_CLK_EPIT2			261
+#define IMX6QDL_CLK_MMDC_P0_IPG			262
+#define IMX6QDL_CLK_DCIC1			263
+#define IMX6QDL_CLK_DCIC2			264
+#define IMX6QDL_CLK_END				265
 
 #endif /* __DT_BINDINGS_CLOCK_IMX6QDL_H */
-- 
2.7.4
