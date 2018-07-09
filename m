From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 8/8] drm/rockchip: dsi: add dual mipi support
Date: Mon,  9 Jul 2018 15:48:34 +0200
Message-ID: <20180709134834.11035-9-heiko@sntech.de>
References: <20180709134834.11035-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180709134834.11035-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the Rockchip-sepcific dual-dsi setup and hook it into the VOP as well.
As described in the general dual-dsi devicetree binding, the panel should
define two input ports and point each of them to one of the used dsi-
controllers, as well as declare one of them as clock-master.
This is used to determine the dual-dsi state and get access to both
controller instances.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 76 ++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  3 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  4 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
 5 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 46e159524ec8..483b753ad5a2 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -218,6 +218,10 @@ struct dw_mipi_dsi_rockchip {
 	struct clk *grf_clk;
 	struct clk *phy_cfg_clk;
 
+	/* dual-channel */
+	bool is_slave;
+	struct dw_mipi_dsi_rockchip *slave;
+
 	unsigned int lane_mbps; /* per lane */
 	u16 input_div;
 	u16 feedback_div;
@@ -602,6 +606,8 @@ dw_mipi_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	s->output_type = DRM_MODE_CONNECTOR_DSI;
+	if (dsi->slave)
+		s->output_flags = ROCKCHIP_OUTPUT_DSI_DUAL;
 
 	return 0;
 }
@@ -617,6 +623,8 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 
 	pm_runtime_get_sync(dsi->dev);
+	if (dsi->slave)
+		pm_runtime_get_sync(dsi->slave->dev);
 
 	/*
 	 * For the RK3399, the clk of grf must be enabled before writing grf
@@ -630,6 +638,8 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	dw_mipi_dsi_rockchip_config(dsi, mux);
+	if (dsi->slave)
+		dw_mipi_dsi_rockchip_config(dsi->slave, mux);
 
 	clk_disable_unprepare(dsi->grf_clk);
 }
@@ -638,6 +648,8 @@ static void dw_mipi_dsi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct dw_mipi_dsi_rockchip *dsi = to_dsi(encoder);
 
+	if (dsi->slave)
+		pm_runtime_put(dsi->slave->dev);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -679,25 +691,82 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 {
 	struct dw_mipi_dsi_rockchip *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct device_node *second_np;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
+	bool master1, master2;
 	int ret;
 
 	/*
-	 * Handle probe-deferrals due to missing display.
+	 * At this point both DSIs (if in use) should have probed and found
+	 * any connected displays or bridges.
+	 * This also takes care of handling possible probe-deferrals.
 	 */
 	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0,
 					  &panel, &bridge);
 	if (ret)
 		return ret;
 
+	second_np = of_mipi_dsi_find_second_host(dsi->dev->of_node, 1, 0);
+	if (IS_ERR(second_np))
+		return PTR_ERR(second_np);
+
 	/*
 	 * We know that there is a panel present but it may not have
 	 * finished attaching to the host. Defer in that case.
+	 * Single-DSI case.
 	 */
-	if (!dw_mipi_dsi_device_attached(dsi->dmd))
+	if (!second_np && !dw_mipi_dsi_device_attached(dsi->dmd))
 		return -EPROBE_DEFER;
 
+	if (second_np) {
+		struct platform_device *pdev;
+
+		master1 = of_property_read_bool(dsi->dev->of_node,
+						"clock-master");
+		master2 = of_property_read_bool(second_np, "clock-master");
+
+		if (master1 && master2) {
+			DRM_DEV_ERROR(dsi->dev, "only one clock-master allowed\n");
+			of_node_put(second_np);
+			return -EINVAL;
+		}
+
+		if (!master1 && !master2) {
+			DRM_DEV_ERROR(dsi->dev, "no clock-master defined\n");
+			of_node_put(second_np);
+			return -EINVAL;
+		}
+
+		/* we are the slave in dual-DSI */
+		if (!master1) {
+			dsi->is_slave = true;
+			of_node_put(second_np);
+			return 0;
+		}
+
+		/* make sure, panel is attached to the master */
+		if (!dw_mipi_dsi_device_attached(dsi->dmd))
+			return -EPROBE_DEFER;
+
+		pdev = of_find_device_by_node(second_np);
+		if (!pdev) {
+			DRM_DEV_ERROR(dev, "could not find slave controller\n");
+			return -ENODEV;
+		}
+
+		dsi->slave = platform_get_drvdata(pdev);
+		if (!dsi->slave) {
+			DRM_DEV_ERROR(dev, "could not get slaves platform-data\n");
+			return -ENODEV;
+		}
+
+		dsi->slave->is_slave = true;
+		dw_mipi_dsi_set_slave(dsi->dmd, dsi->slave->dmd);
+
+		of_node_put(second_np);
+	}
+
 	ret = clk_prepare_enable(dsi->pllref_clk);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to enable pllref_clk: %d\n", ret);
@@ -725,6 +794,9 @@ static void dw_mipi_dsi_rockchip_unbind(struct device *dev,
 {
 	struct dw_mipi_dsi_rockchip *dsi = dev_get_drvdata(dev);
 
+	if (dsi->is_slave)
+		return;
+
 	dw_mipi_dsi_unbind(dsi->dmd);
 
 	clk_disable_unprepare(dsi->pllref_clk);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 96bb4ca8febf..2e6d2d4d1b65 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -37,6 +37,7 @@ struct rockchip_crtc_state {
 	int output_type;
 	int output_mode;
 	int output_bpc;
+	int output_flags;
 };
 #define to_rockchip_crtc_state(s) \
 		container_of(s, struct rockchip_crtc_state, base)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index effecbed2d11..313b163a346b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -916,6 +916,7 @@ static void vop_crtc_atomic_enable(struct drm_crtc *crtc,
 	pin_pol |= (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC) ?
 		   BIT(VSYNC_POSITIVE) : 0;
 	VOP_REG_SET(vop, output, pin_pol, pin_pol);
+	VOP_REG_SET(vop, output, mipi_dual_channel_en, 0);
 
 	switch (s->output_type) {
 	case DRM_MODE_CONNECTOR_LVDS:
@@ -933,6 +934,8 @@ static void vop_crtc_atomic_enable(struct drm_crtc *crtc,
 	case DRM_MODE_CONNECTOR_DSI:
 		VOP_REG_SET(vop, output, mipi_pin_pol, pin_pol);
 		VOP_REG_SET(vop, output, mipi_en, 1);
+		VOP_REG_SET(vop, output, mipi_dual_channel_en,
+			    !!(s->output_flags & ROCKCHIP_OUTPUT_DSI_DUAL));
 		break;
 	case DRM_MODE_CONNECTOR_DisplayPort:
 		pin_pol &= ~BIT(DCLK_INVERT);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index fcb91041a666..361e4c7d225c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -60,6 +60,7 @@ struct vop_output {
 	struct vop_reg edp_en;
 	struct vop_reg hdmi_en;
 	struct vop_reg mipi_en;
+	struct vop_reg mipi_dual_channel_en;
 	struct vop_reg rgb_en;
 };
 
@@ -213,6 +214,9 @@ struct vop_data {
 /* for use special outface */
 #define ROCKCHIP_OUT_MODE_AAAA	15
 
+/* output flags */
+#define ROCKCHIP_OUTPUT_DSI_DUAL	BIT(0)
+
 enum alpha_mode {
 	ALPHA_STRAIGHT,
 	ALPHA_INVERSE,
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 08023d3ecb76..56d83f1c2599 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -421,6 +421,7 @@ static const struct vop_output rk3399_output = {
 	.hdmi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 13),
 	.edp_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 14),
 	.mipi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 15),
+	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
 };
 
 static const struct vop_data rk3399_vop_big = {
-- 
2.17.0
