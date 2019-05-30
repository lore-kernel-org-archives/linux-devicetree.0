From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/4] drm/msm/dsi: Add support for MSM8998 10nm dsi phy
Date: Thu, 30 May 2019 09:00:39 -0700
Message-ID: <20190530160039.2824-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, mark.rutland@arm.com, sibis@codeaurora.org, chandanu@codeaurora.org, abhinavk@codeaurora.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The MSM8998 dsi phy is 10nm v3.0.0 like SDM845, however there appear to
be minor differences such as the address space location.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 1760483b247e..fda73749fcc0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -507,6 +507,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
 	  .data = &dsi_phy_10nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-10nm-8998",
+	  .data = &dsi_phy_10nm_8998_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index a24ab80994a3..7161beb23b03 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -49,6 +49,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_pre;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 44959e79ce28..b1e7dbc69fa6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -221,3 +221,21 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
+	.type = MSM_DSI_PHY_10NM,
+	.src_pll_truthtable = { {false, false}, {true, false} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 36000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_10nm_phy_enable,
+		.disable = dsi_10nm_phy_disable,
+		.init = dsi_10nm_phy_init,
+	},
+	.io_start = { 0xc994400, 0xc996400 },
+	.num_dsi_phy = 2,
+};
-- 
2.17.1
