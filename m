From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v13 07/12] drm/mediatek: cleaning up and refine
Date: Fri, 31 Mar 2017 19:30:34 +0800
Message-ID: <1490959839-39816-8-git-send-email-yt.shen@mediatek.com>
References: <1490959839-39816-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490959839-39816-1-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shaoming chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

cleaning up unused define and refine function name and variable

Signed-off-by: shaoming chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 73 ++++++++++++++++------------------
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c |  8 ++--
 2 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index dd71cbb..5d66b98 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -27,9 +27,6 @@
 
 #include "mtk_drm_ddp_comp.h"
 
-#define DSI_VIDEO_FIFO_DEPTH	(1920 / 4)
-#define DSI_HOST_FIFO_DEPTH	64
-
 #define DSI_START		0x00
 
 #define DSI_CON_CTRL		0x10
@@ -46,7 +43,7 @@
 #define MIX_MODE			BIT(17)
 
 #define DSI_TXRX_CTRL		0x18
-#define VC_NUM				(2 << 0)
+#define VC_NUM				BIT(1)
 #define LANE_NUM			(0xf << 2)
 #define DIS_EOT				BIT(6)
 #define NULL_EN				BIT(7)
@@ -164,7 +161,7 @@ static void mtk_dsi_mask(struct mtk_dsi *dsi, u32 offset, u32 mask, u32 data)
 	writel((temp & ~mask) | (data & mask), dsi->regs + offset);
 }
 
-static void dsi_phy_timconfig(struct mtk_dsi *dsi)
+static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 {
 	u32 timcon0, timcon1, timcon2, timcon3;
 	u32 ui, cycle_time;
@@ -196,7 +193,7 @@ static void mtk_dsi_disable(struct mtk_dsi *dsi)
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, 0);
 }
 
-static void mtk_dsi_reset(struct mtk_dsi *dsi)
+static void mtk_dsi_reset_engine(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, DSI_RESET);
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, 0);
@@ -267,8 +264,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	}
 
 	mtk_dsi_enable(dsi);
-	mtk_dsi_reset(dsi);
-	dsi_phy_timconfig(dsi);
+	mtk_dsi_reset_engine(dsi);
+	mtk_dsi_phy_timconfig(dsi);
 
 	return 0;
 
@@ -281,33 +278,33 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	return ret;
 }
 
-static void dsi_clk_ulp_mode_enter(struct mtk_dsi *dsi)
+static void mtk_dsi_clk_ulp_mode_enter(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
 }
 
-static void dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
+static void mtk_dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, LC_WAKEUP_EN);
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, 0);
 }
 
-static void dsi_lane0_ulp_mode_enter(struct mtk_dsi *dsi)
+static void mtk_dsi_lane0_ulp_mode_enter(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_HS_TX_EN, 0);
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
 }
 
-static void dsi_lane0_ulp_mode_leave(struct mtk_dsi *dsi)
+static void mtk_dsi_lane0_ulp_mode_leave(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, LD0_WAKEUP_EN);
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, 0);
 }
 
-static bool dsi_clk_hs_state(struct mtk_dsi *dsi)
+static bool mtk_dsi_clk_hs_state(struct mtk_dsi *dsi)
 {
 	u32 tmp_reg1;
 
@@ -315,15 +312,15 @@ static bool dsi_clk_hs_state(struct mtk_dsi *dsi)
 	return ((tmp_reg1 & LC_HS_TX_EN) == 1) ? true : false;
 }
 
-static void dsi_clk_hs_mode(struct mtk_dsi *dsi, bool enter)
+static void mtk_dsi_clk_hs_mode(struct mtk_dsi *dsi, bool enter)
 {
-	if (enter && !dsi_clk_hs_state(dsi))
+	if (enter && !mtk_dsi_clk_hs_state(dsi))
 		mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, LC_HS_TX_EN);
-	else if (!enter && dsi_clk_hs_state(dsi))
+	else if (!enter && mtk_dsi_clk_hs_state(dsi))
 		mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
 }
 
-static void dsi_set_mode(struct mtk_dsi *dsi)
+static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
 {
 	u32 vid_mode = CMD_MODE;
 
@@ -338,7 +335,7 @@ static void dsi_set_mode(struct mtk_dsi *dsi)
 	writel(vid_mode, dsi->regs + DSI_MODE_CTRL);
 }
 
-static void dsi_ps_control_vact(struct mtk_dsi *dsi)
+static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
 {
 	struct videomode *vm = &dsi->vm;
 	u32 dsi_buf_bpp, ps_wc;
@@ -372,7 +369,7 @@ static void dsi_ps_control_vact(struct mtk_dsi *dsi)
 	writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
 }
 
-static void dsi_rxtx_control(struct mtk_dsi *dsi)
+static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 {
 	u32 tmp_reg;
 
@@ -397,9 +394,9 @@ static void dsi_rxtx_control(struct mtk_dsi *dsi)
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
 }
 
-static void dsi_ps_control(struct mtk_dsi *dsi)
+static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
 {
-	unsigned int dsi_tmp_buf_bpp;
+	u32 dsi_tmp_buf_bpp;
 	u32 tmp_reg;
 
 	switch (dsi->format) {
@@ -429,12 +426,12 @@ static void dsi_ps_control(struct mtk_dsi *dsi)
 	writel(tmp_reg, dsi->regs + DSI_PSCTRL);
 }
 
-static void dsi_config_vdo_timing(struct mtk_dsi *dsi)
+static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 {
-	unsigned int horizontal_sync_active_byte;
-	unsigned int horizontal_backporch_byte;
-	unsigned int horizontal_frontporch_byte;
-	unsigned int dsi_tmp_buf_bpp;
+	u32 horizontal_sync_active_byte;
+	u32 horizontal_backporch_byte;
+	u32 horizontal_frontporch_byte;
+	u32 dsi_tmp_buf_bpp;
 
 	struct videomode *vm = &dsi->vm;
 
@@ -463,7 +460,7 @@ static void dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
 
-	dsi_ps_control(dsi);
+	mtk_dsi_ps_control(dsi);
 }
 
 static void mtk_dsi_start(struct mtk_dsi *dsi)
@@ -480,8 +477,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
-	dsi_lane0_ulp_mode_enter(dsi);
-	dsi_clk_ulp_mode_enter(dsi);
+	mtk_dsi_lane0_ulp_mode_enter(dsi);
+	mtk_dsi_clk_ulp_mode_enter(dsi);
 
 	mtk_dsi_disable(dsi);
 
@@ -511,18 +508,18 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 		return;
 	}
 
-	dsi_rxtx_control(dsi);
+	mtk_dsi_rxtx_control(dsi);
 
-	dsi_clk_ulp_mode_leave(dsi);
-	dsi_lane0_ulp_mode_leave(dsi);
-	dsi_clk_hs_mode(dsi, 0);
-	dsi_set_mode(dsi);
+	mtk_dsi_clk_ulp_mode_leave(dsi);
+	mtk_dsi_lane0_ulp_mode_leave(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 0);
+	mtk_dsi_set_mode(dsi);
 
-	dsi_ps_control_vact(dsi);
-	dsi_config_vdo_timing(dsi);
+	mtk_dsi_ps_control_vact(dsi);
+	mtk_dsi_config_vdo_timing(dsi);
 
-	dsi_set_mode(dsi);
-	dsi_clk_hs_mode(dsi, 1);
+	mtk_dsi_set_mode(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	mtk_dsi_start(dsi);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index c4a0165..fd84914 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -134,7 +134,7 @@ struct mtk_mipitx_data {
 struct mtk_mipi_tx {
 	struct device *dev;
 	void __iomem *regs;
-	unsigned int data_rate;
+	u32 data_rate;
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
 	struct clk *pll;
@@ -172,7 +172,7 @@ static void mtk_mipi_tx_update_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
 static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
-	unsigned int txdiv, txdiv0, txdiv1;
+	u8 txdiv, txdiv0, txdiv1;
 	u64 pcw;
 
 	dev_dbg(mipi_tx->dev, "prepare: %u Hz\n", mipi_tx->data_rate);
@@ -326,7 +326,7 @@ static unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
 static int mtk_mipi_tx_power_on_signal(struct phy *phy)
 {
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
-	unsigned int reg;
+	u32 reg;
 
 	for (reg = MIPITX_DSI_CLOCK_LANE;
 	     reg <= MIPITX_DSI_DATA_LANE3; reg += 4)
@@ -357,7 +357,7 @@ static int mtk_mipi_tx_power_on(struct phy *phy)
 static void mtk_mipi_tx_power_off_signal(struct phy *phy)
 {
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
-	unsigned int reg;
+	u32 reg;
 
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_TOP_CON,
 			     RG_DSI_PAD_TIE_LOW_EN);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
