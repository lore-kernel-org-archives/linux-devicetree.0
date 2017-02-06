From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 1/5] drm/exynos: dsi: Fix the parse_dt function
Date: Mon, 06 Feb 2017 11:19:40 +0900
Message-ID: <1486347584-6762-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021950epcas1p36b27f17497f0dcb0be8050db64828abc@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: devicetree@vger.kernel.org

The bridge_node may or may not be required.
For example, mic and dsi are connected to OF graph, but fimd and dsi
are not connected. Also the OF graph is not needed because the panel
is a child of dsi. So not have to go to the endpoint and parse the
burst, esc clock-frequency.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e07cb1f..214d486 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1652,39 +1652,23 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;
 
-	ep = of_graph_get_endpoint_by_regs(node, DSI_PORT_OUT, 0);
-	if (!ep) {
-		dev_err(dev, "no output port with endpoint specified\n");
-		return -EINVAL;
-	}
-
-	ret = exynos_dsi_of_read_u32(ep, "samsung,burst-clock-frequency",
+	ret = exynos_dsi_of_read_u32(node, "samsung,burst-clock-frequency",
 				     &dsi->burst_clk_rate);
 	if (ret < 0)
-		goto end;
+		return ret;
 
-	ret = exynos_dsi_of_read_u32(ep, "samsung,esc-clock-frequency",
+	ret = exynos_dsi_of_read_u32(node, "samsung,esc-clock-frequency",
 				     &dsi->esc_clk_rate);
 	if (ret < 0)
-		goto end;
-
-	of_node_put(ep);
+		return ret;
 
 	ep = of_graph_get_next_endpoint(node, NULL);
-	if (!ep) {
-		ret = -EINVAL;
-		goto end;
-	}
-
-	dsi->bridge_node = of_graph_get_remote_port_parent(ep);
-	if (!dsi->bridge_node) {
-		ret = -EINVAL;
-		goto end;
+	if (ep) {
+		dsi->bridge_node = of_graph_get_remote_port_parent(ep);
+		of_node_put(ep);
 	}
-end:
-	of_node_put(ep);
 
-	return ret;
+	return 0;
 }
 
 static int exynos_dsi_bind(struct device *dev, struct device *master,
-- 
1.9.1
