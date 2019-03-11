From: Eric Nelson <eric@nelint.com>
Subject: [V2 1/2] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 11 Mar 2019 08:59:56 -0700
Message-ID: <1552319997-24622-2-git-send-email-eric@nelint.com>
References: <1552304271.2453.12.camel@pengutronix.de>
 <1552319997-24622-1-git-send-email-eric@nelint.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552319997-24622-1-git-send-email-eric@nelint.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com, Eric Nelson <eric@nelint.com>
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
Changes in v2:
 * Keep numbering of clock array as suggested by Lucas Stach
 * Sent as series with updates to several device tree files
 * Expanded cc list to include maintainers of device trees

 drivers/clk/imx/clk-imx6q.c               |  7 +++----
 include/dt-bindings/clock/imx6qdl-clock.h | 10 +++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

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
index b3cef29..34bb14d 100644
--- a/include/dt-bindings/clock/imx6qdl-clock.h
+++ b/include/dt-bindings/clock/imx6qdl-clock.h
@@ -213,7 +213,15 @@
 #define IMX6QDL_CLK_CKO2			200
 #define IMX6QDL_CLK_CKO				201
 #define IMX6QDL_CLK_VDOA			202
-#define IMX6QDL_CLK_PLL4_AUDIO_DIV		203
+
+/* The PLL4_AUDIO_DIV divider only appeared in
+ * early versions of the reference manual.
+ *
+ * Renamed to _BROKEN to prevent inadvertent use,
+ * but reserved the array slot to maintain DT binary
+ * compatibility.
+ */
+#define IMX6QDL_CLK_PLL4_AUDIO_DIV_BROKEN	203
 #define IMX6QDL_CLK_LVDS1_SEL			204
 #define IMX6QDL_CLK_LVDS2_SEL			205
 #define IMX6QDL_CLK_LVDS1_GATE			206
-- 
2.7.4
