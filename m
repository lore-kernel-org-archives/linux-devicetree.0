From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 08/10] drm/mediatek: update DSI sub driver flow
Date: Thu, 28 Jul 2016 17:28:02 +0800
Message-ID: <1469698084-20185-9-git-send-email-yt.shen@mediatek.com>
References: <1469698084-20185-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469698084-20185-1-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shaoming chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch update enable/disable flow of DSI module and MIPI TX module

Signed-off-by: shaoming chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c     |  104 ++++++++++++++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c |   32 +++++-----
 2 files changed, 103 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 1d36524..2646f83 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -95,6 +95,8 @@
 #define DSI_RACK		0x84
 #define RACK				BIT(0)
 
+#define DSI_MEM_CONTI		0x90
+
 #define DSI_PHY_LCCON		0x104
 #define LC_HS_TX_EN			BIT(0)
 #define LC_ULPM_EN			BIT(1)
@@ -127,6 +129,10 @@
 #define CLK_HS_POST			(0xff << 8)
 #define CLK_HS_EXIT			(0xff << 16)
 
+#define DSI_VM_CMD_CON		0x130
+#define VM_CMD_EN			BIT(0)
+#define TS_VFP_EN			BIT(5)
+
 #define DSI_CMDQ0		0x180
 
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
@@ -266,7 +272,9 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	 * mipi_ratio is mipi clk coefficient for balance the pixel clk in mipi.
 	 * we set mipi_ratio is 1.05.
 	 */
-	dsi->data_rate = dsi->vm.pixelclock * 3 * 21 / (1 * 1000 * 10);
+	dsi->data_rate = dsi->vm.pixelclock * 12 * 21;
+	dsi->data_rate /= (dsi->lanes * 1000 * 10);
+	dev_info(dev, "set mipitx's data rate: %dMHz\n", dsi->data_rate);
 
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate * 1000000);
 	if (ret < 0) {
@@ -288,10 +296,6 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		goto err_disable_engine_clk;
 	}
 
-	mtk_dsi_enable(dsi);
-	mtk_dsi_reset_engine(dsi);
-	mtk_dsi_phy_timconfig(dsi);
-
 	return 0;
 
 err_disable_engine_clk:
@@ -306,7 +310,7 @@ err_refcount:
 static void mtk_dsi_clk_ulp_mode_enter(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, LC_ULPM_EN);
 }
 
 static void mtk_dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
@@ -319,7 +323,7 @@ static void mtk_dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
 static void mtk_dsi_lane0_ulp_mode_enter(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_HS_TX_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, LD0_ULPM_EN);
 }
 
 static void mtk_dsi_lane0_ulp_mode_leave(struct mtk_dsi *dsi)
@@ -355,11 +359,21 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
 		if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
 		    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
 			vid_mode = BURST_MODE;
+		else
+			vid_mode = SYNC_EVENT_MODE;
 	}
 
 	writel(vid_mode, dsi->regs + DSI_MODE_CTRL);
 }
 
+static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
+{
+	writel(0x3c, dsi->regs + DSI_MEM_CONTI);
+
+	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
+	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
+}
+
 static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
 {
 	struct videomode *vm = &dsi->vm;
@@ -416,6 +430,9 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 		break;
 	}
 
+	tmp_reg |= (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) << 6;
+	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET) >> 3;
+
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
 }
 
@@ -494,6 +511,16 @@ static void mtk_dsi_start(struct mtk_dsi *dsi)
 	writel(1, dsi->regs + DSI_START);
 }
 
+static void mtk_dsi_stop(struct mtk_dsi *dsi)
+{
+	writel(0, dsi->regs + DSI_START);
+}
+
+static void mtk_dsi_set_cmd_mode(struct mtk_dsi *dsi)
+{
+	writel(CMD_MODE, dsi->regs + DSI_MODE_CTRL);
+}
+
 static void mtk_dsi_set_interrupt_enable(struct mtk_dsi *dsi)
 {
 	u32 inten = DSI_INT_ALL_BITS;
@@ -543,6 +570,27 @@ static irqreturn_t mtk_dsi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi)
+{
+	s32 ret = 0;
+	unsigned long timeout = msecs_to_jiffies(500);
+
+	mtk_dsi_set_cmd_mode(dsi);
+
+	ret = wait_event_interruptible_timeout(_dsi_wait_vm_done_queue,
+				dsi->irq_data & VM_DONE_INT_FLAG, timeout);
+	if (ret == 0) {
+		dev_info(dsi->dev, "dsi wait engine idle timeout\n");
+
+		mtk_dsi_enable(dsi);
+		mtk_dsi_reset_engine(dsi);
+
+		return;
+	}
+
+	dsi->irq_data &= ~VM_DONE_INT_FLAG;
+}
+
 static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 {
 	if (WARN_ON(dsi->refcount == 0))
@@ -551,6 +599,17 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
+	mtk_dsi_switch_to_cmd_mode(dsi);
+
+	if (dsi->panel) {
+		if (drm_panel_unprepare(dsi->panel)) {
+			DRM_ERROR("failed to unprepare the panel\n");
+			return;
+		}
+	}
+
+	mtk_dsi_reset_engine(dsi);
+
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
 
@@ -569,29 +628,37 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 	if (dsi->enabled)
 		return;
 
-	if (dsi->panel) {
-		if (drm_panel_prepare(dsi->panel)) {
-			DRM_ERROR("failed to setup the panel\n");
-			return;
-		}
-	}
-
 	ret = mtk_dsi_poweron(dsi);
 	if (ret < 0) {
 		DRM_ERROR("failed to power on dsi\n");
 		return;
 	}
 
+	usleep_range(20000, 21000);
+
 	mtk_dsi_rxtx_control(dsi);
+	mtk_dsi_phy_timconfig(dsi);
+	mtk_dsi_ps_control_vact(dsi);
+	mtk_dsi_set_vm_cmd(dsi);
+	mtk_dsi_config_vdo_timing(dsi);
+	mtk_dsi_set_interrupt_enable(dsi);
 
+	mtk_dsi_enable(dsi);
 	mtk_dsi_clk_ulp_mode_leave(dsi);
 	mtk_dsi_lane0_ulp_mode_leave(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 0);
-	mtk_dsi_set_mode(dsi);
 
-	mtk_dsi_ps_control_vact(dsi);
-	mtk_dsi_config_vdo_timing(dsi);
-	mtk_dsi_set_interrupt_enable(dsi);
+	if (dsi->panel) {
+		if (drm_panel_prepare(dsi->panel)) {
+			DRM_ERROR("failed to prepare the panel\n");
+			return;
+		}
+
+		if (drm_panel_enable(dsi->panel)) {
+			DRM_ERROR("failed to enable the panel\n");
+			return;
+		}
+	}
 
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
@@ -613,6 +680,7 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 		}
 	}
 
+	mtk_dsi_stop(dsi);
 	mtk_dsi_poweroff(dsi);
 
 	dsi->enabled = false;
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index 19481c7..0666f15 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -168,7 +168,9 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 
 	dev_dbg(mipi_tx->dev, "prepare: %u Hz\n", mipi_tx->data_rate);
 
-	if (mipi_tx->data_rate >= 500000000) {
+	if (mipi_tx->data_rate > 1250000000) {
+		return -EINVAL;
+	} else if (mipi_tx->data_rate >= 500000000) {
 		txdiv = 1;
 		txdiv0 = 0;
 		txdiv1 = 0;
@@ -192,6 +194,10 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
+				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
+				(8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
+
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_BG_CON,
 				RG_DSI_VOUT_MSK |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
@@ -201,24 +207,18 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 
 	usleep_range(30, 100);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
-				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
-				(8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
-
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_CON,
-			     RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_CON,
+				RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN,
+				RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
 
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_PWR,
 				RG_DSI_MPPLL_SDM_PWR_ON |
 				RG_DSI_MPPLL_SDM_ISO_EN,
 				RG_DSI_MPPLL_SDM_PWR_ON);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-			       RG_DSI_MPPLL_PLL_EN);
-
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-				RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
-				RG_DSI_MPPLL_PREDIV,
+				RG_DSI_MPPLL_PREDIV | RG_DSI_MPPLL_TXDIV0 |
+				RG_DSI_MPPLL_TXDIV1 | RG_DSI_MPPLL_POSDIV,
 				(txdiv0 << 3) | (txdiv1 << 5));
 
 	/*
@@ -233,10 +233,12 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 		      26000000);
 	writel(pcw, mipi_tx->regs + MIPITX_DSI_PLL_CON2);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
-			     RG_DSI_MPPLL_SDM_FRA_EN);
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
+				RG_DSI_MPPLL_SDM_FRA_EN,
+				RG_DSI_MPPLL_SDM_FRA_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
+				RG_DSI_MPPLL_PLL_EN, RG_DSI_MPPLL_PLL_EN);
 
 	usleep_range(20, 100);
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
