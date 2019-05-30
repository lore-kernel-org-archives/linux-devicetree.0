From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 3/4] drm/msm/dsi: Add old timings quirk for 10nm phy
Date: Thu, 30 May 2019 09:00:49 -0700
Message-ID: <20190530160049.2875-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, mark.rutland@arm.com, sibis@codeaurora.org, chandanu@codeaurora.org, abhinavk@codeaurora.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The v3.0.0 10nm phy has two different implementations between MSM8998 and
SDM845, which require different timings calculations.  Unfortunately, the
hardware designers did not choose to revise the version to account for this
delta so implement a quirk instead.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  4 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 12 +++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7161beb23b03..3c51df1aa2ee 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -21,6 +21,9 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
+/* v3.0.0 10nm implementation that requires the old timings settings */
+#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
+
 struct msm_dsi_phy_ops {
 	int (*init) (struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
@@ -41,6 +44,7 @@ struct msm_dsi_phy_cfg {
 	bool src_pll_truthtable[DSI_MAX][DSI_MAX];
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
+	const int quirks;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index b1e7dbc69fa6..eb28937f4b34 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -42,6 +42,9 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
 	void __iomem *lane_base = phy->lane_base;
 
+	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
+		tx_dctrl[3] = 0x02;
+
 	/* Strength ctrl settings */
 	for (i = 0; i < 5; i++) {
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(i),
@@ -74,9 +77,11 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	/* Toggle BIT 0 to release freeze I/0 */
-	dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
-	dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
+	if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
+		/* Toggle BIT 0 to release freeze I/0 */
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
+	}
 }
 
 static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
@@ -238,4 +243,5 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
+	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
 };
-- 
2.17.1
