From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH v2 2/4] drm: dw-hdmi: passing the "plat_data" when calling platform mode_valid
Date: Thu,  7 Jan 2016 17:00:19 +0800
Message-ID: <1452157219-18635-1-git-send-email-ykk@rock-chips.com>
References: <1452156811-18150-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452156811-18150-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Zheng Yang <zhengyang@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Make it easy for platform driver could recovery the private data that
would help to valid the display mode.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2: None

 drivers/gpu/drm/bridge/dw-hdmi.c            |  5 +++--
 drivers/gpu/drm/imx/dw_hdmi-imx.c           | 10 ++++++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
 include/drm/bridge/dw_hdmi.h                |  2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 6fbec99..5ad72ec 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1476,14 +1476,15 @@ dw_hdmi_connector_mode_valid(struct drm_connector *connector,
 {
 	struct dw_hdmi *hdmi = container_of(connector,
 					   struct dw_hdmi, connector);
+	const struct dw_hdmi_plat_data *plat_data = hdmi->plat_data;
 	enum drm_mode_status mode_status = MODE_OK;
 
 	/* We don't support double-clocked modes */
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	if (hdmi->plat_data->mode_valid)
-		mode_status = hdmi->plat_data->mode_valid(connector, mode);
+	if (plat_data->mode_valid)
+		mode_status = plat_data->mode_valid(plat_data, mode);
 
 	return mode_status;
 }
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index 0968610..8b0a7da 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -150,8 +150,9 @@ static const struct drm_encoder_funcs dw_hdmi_imx_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static enum drm_mode_status imx6q_hdmi_mode_valid(struct drm_connector *con,
-						  struct drm_display_mode *mode)
+static enum drm_mode_status
+imx6q_hdmi_mode_valid(const struct dw_hdmi_plat_data *plat_data,
+		      struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
 		return MODE_CLOCK_LOW;
@@ -162,8 +163,9 @@ static enum drm_mode_status imx6q_hdmi_mode_valid(struct drm_connector *con,
 	return MODE_OK;
 }
 
-static enum drm_mode_status imx6dl_hdmi_mode_valid(struct drm_connector *con,
-						   struct drm_display_mode *mode)
+static enum drm_mode_status
+imx6dl_hdmi_mode_valid(const struct dw_hdmi_plat_data *plat_data,
+		       struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
 		return MODE_CLOCK_LOW;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index d5816b3..8164823 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -156,7 +156,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 }
 
 static enum drm_mode_status
-dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
+dw_hdmi_rockchip_mode_valid(const struct dw_hdmi_plat_data *plat_data,
 			    struct drm_display_mode *mode)
 {
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index bae79f3..f8dec64 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -52,7 +52,7 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
-	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+	enum drm_mode_status (*mode_valid)(const struct dw_hdmi_plat_data *pd,
 					   struct drm_display_mode *mode);
 };
 
-- 
2.1.2
