From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 7/8] drm/bridge/synopsys: dsi: add dual-dsi support
Date: Mon,  9 Jul 2018 15:48:33 +0200
Message-ID: <20180709134834.11035-8-heiko@sntech.de>
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

From: Nickey Yang <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Allow to also drive a slave dw-mipi-dsi controller in a dual-dsi
setup. This will require additional implementation-specific
code to look up the slave instance and do specific setup.
Also will probably need code in the specific crtcs as dual-dsi
does not equal two separate dsi outputs.

To activate, the implementation-specific code should set the slave
using dw_mipi_dsi_set_slave() before calling __dw_mipi_dsi_bind().

v2:
- expect real interface number of lanes
- keep links to both master and slave
v3:
- remove unneeded separate variables
- remove unneeded second slave settings
- disable slave before master
- lane-sum calculation comments

Signed-off-by: Nickey Yang <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 80 +++++++++++++++++--
 include/drm/bridge/dw_mipi_dsi.h              |  1 +
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 88fed22ff3f6..286fa6f5788c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -232,9 +232,20 @@ struct dw_mipi_dsi {
 	u32 format;
 	unsigned long mode_flags;
 
+	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
+	struct dw_mipi_dsi *slave; /* dual-dsi slave ptr */
+
 	const struct dw_mipi_dsi_plat_data *plat_data;
 };
 
+/*
+ * Check if either a link to a master or slave is present
+ */
+static inline bool dw_mipi_is_dual_mode(struct dw_mipi_dsi *dsi)
+{
+	return dsi->slave || dsi->master;
+}
+
 /*
  * The controller should generate 2 frames before
  * preparing the peripheral.
@@ -464,10 +475,17 @@ static ssize_t dw_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
 	}
 
 	dw_mipi_message_config(dsi, msg);
+	if (dsi->slave)
+		dw_mipi_message_config(dsi->slave, msg);
 
 	ret = dw_mipi_dsi_write(dsi, &packet);
 	if (ret)
 		return ret;
+	if (dsi->slave) {
+		ret = dw_mipi_dsi_write(dsi->slave, &packet);
+		if (ret)
+			return ret;
+	}
 
 	if (msg->rx_buf && msg->rx_len) {
 		ret = dw_mipi_dsi_read(dsi, msg);
@@ -606,7 +624,11 @@ static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
 	 * DSI_VNPCR.NPSIZE... especially because this driver supports
 	 * non-burst video modes, see dw_mipi_dsi_video_mode_config()...
 	 */
-	dsi_write(dsi, DSI_VID_PKT_SIZE, VID_PKT_SIZE(mode->hdisplay));
+
+	dsi_write(dsi, DSI_VID_PKT_SIZE,
+		       dw_mipi_is_dual_mode(dsi) ?
+				VID_PKT_SIZE(mode->hdisplay / 2) :
+				VID_PKT_SIZE(mode->hdisplay));
 }
 
 static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
@@ -778,24 +800,43 @@ static void dw_mipi_dsi_bridge_post_disable(struct drm_bridge *bridge)
 	 */
 	dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
 
+	if (dsi->slave) {
+		dw_mipi_dsi_disable(dsi->slave);
+		clk_disable_unprepare(dsi->slave->pclk);
+		pm_runtime_put(dsi->slave->dev);
+	}
 	dw_mipi_dsi_disable(dsi);
+
 	clk_disable_unprepare(dsi->pclk);
 	pm_runtime_put(dsi->dev);
 }
 
-static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
-					struct drm_display_mode *mode,
-					struct drm_display_mode *adjusted_mode)
+static unsigned int dw_mipi_dsi_get_lanes(struct dw_mipi_dsi *dsi)
+{
+	/* this instance is the slave, so add the master's lanes */
+	if (dsi->master)
+		return dsi->master->lanes + dsi->lanes;
+
+	/* this instance is the master, so add the slave's lanes */
+	if (dsi->slave)
+		return dsi->lanes + dsi->slave->lanes;
+
+	/* single-dsi, so no other instance to consider */
+	return dsi->lanes;
+}
+
+static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
+				struct drm_display_mode *adjusted_mode)
 {
-	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
 	void *priv_data = dsi->plat_data->priv_data;
 	int ret;
+	u32 lanes = dw_mipi_dsi_get_lanes(dsi);
 
 	clk_prepare_enable(dsi->pclk);
 
 	ret = phy_ops->get_lane_mbps(priv_data, adjusted_mode, dsi->mode_flags,
-				     dsi->lanes, dsi->format, &dsi->lane_mbps);
+				     lanes, dsi->format, &dsi->lane_mbps);
 	if (ret)
 		DRM_DEBUG_DRIVER("Phy get_lane_mbps() failed\n");
 
@@ -827,12 +868,25 @@ static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	dw_mipi_dsi_set_mode(dsi, 0);
 }
 
+static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_display_mode *mode,
+					struct drm_display_mode *adjusted_mode)
+{
+	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+
+	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
+	if (dsi->slave)
+		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
+}
+
 static void dw_mipi_dsi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* Switch to video mode for panel-bridge enable & panel enable */
 	dw_mipi_dsi_set_mode(dsi, MIPI_DSI_MODE_VIDEO);
+	if (dsi->slave)
+		dw_mipi_dsi_set_mode(dsi->slave, MIPI_DSI_MODE_VIDEO);
 }
 
 static enum drm_mode_status
@@ -971,6 +1025,20 @@ static void __dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
 	pm_runtime_disable(dsi->dev);
 }
 
+void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave)
+{
+	/* introduce controllers to each other */
+	dsi->slave = slave;
+	dsi->slave->master = dsi;
+
+	/* migrate settings for already attached displays */
+	dsi->slave->lanes = dsi->lanes;
+	dsi->slave->channel = dsi->channel;
+	dsi->slave->format = dsi->format;
+	dsi->slave->mode_flags = dsi->mode_flags;
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi_set_slave);
+
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 131ff2569ed4..ba34966848b8 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -38,5 +38,6 @@ struct dw_mipi_dsi *dw_mipi_dsi_probe(struct platform_device *pdev,
 void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
+void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave);
 
 #endif /* __DW_MIPI_DSI__ */
-- 
2.17.0
