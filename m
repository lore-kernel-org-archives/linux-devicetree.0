From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Fri,  3 Feb 2017 21:36:33 -0600
Message-ID: <20170204033635.10250-4-robh@kernel.org>
References: <20170204033635.10250-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170204033635.10250-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

Convert drivers to use the new of_graph_get_remote_node() helper
instead of parsing the endpoint node and then getting the remote device
node. Now drivers can just specify the device node and which
port/endpoint and get back the connected remote device node. The details
of the graph binding are nicely abstracted into the core OF graph code.

This changes some error messages to debug messages (in the graph core).
Graph connections are often "no connects" depending on the particular
board, so we want to avoid spurious messages. Plus the kernel is not a
DT validator.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/arm/hdlcd_drv.c                 | 22 ++-------
 drivers/gpu/drm/arm/malidp_drv.c                | 29 ++---------
 drivers/gpu/drm/bridge/adv7511/adv7533.c        | 12 +----
 drivers/gpu/drm/bridge/dumb-vga-dac.c           | 15 ++----
 drivers/gpu/drm/bridge/ti-tfp410.c              | 15 ++----
 drivers/gpu/drm/exynos/exynos_drm_dpi.c         | 16 +-----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c         | 13 ++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c         | 27 +---------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 26 ++--------
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 30 +----------
 drivers/gpu/drm/mediatek/mtk_dpi.c              | 12 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c             | 26 ++--------
 drivers/gpu/drm/meson/meson_drv.c               | 12 ++---
 drivers/gpu/drm/meson/meson_venc_cvbs.c         | 19 ++-----
 drivers/gpu/drm/msm/dsi/dsi_host.c              |  3 +-
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c         | 28 +----------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 18 +++----
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c            | 11 +----
 drivers/gpu/drm/tilcdc/tilcdc_external.c        | 66 +++----------------------
 drivers/gpu/drm/vc4/vc4_dpi.c                   | 15 ++----
 20 files changed, 64 insertions(+), 351 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e5f4f4a6546d..0f70f5fe9970 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -430,29 +430,13 @@ static int compare_dev(struct device *dev, void *data)
 
 static int hdlcd_probe(struct platform_device *pdev)
 {
-	struct device_node *port, *ep;
+	struct device_node *port;
 	struct component_match *match = NULL;
 
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
 	/* there is only one output port inside each device, find it */
-	ep = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
-	if (!ep)
-		return -ENODEV;
-
-	if (!of_device_is_available(ep)) {
-		of_node_put(ep);
+	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
+	if (!port)
 		return -ENODEV;
-	}
-
-	/* add the remote encoder port as component */
-	port = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-	if (!port || !of_device_is_available(port)) {
-		of_node_put(port);
-		return -EAGAIN;
-	}
 
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
 	of_node_put(port);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 32f746e31379..bfa04be7f5de 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -262,7 +262,6 @@ static int malidp_bind(struct device *dev)
 {
 	struct resource *res;
 	struct drm_device *drm;
-	struct device_node *ep;
 	struct malidp_drm *malidp;
 	struct malidp_hw_device *hwdev;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -360,12 +359,7 @@ static int malidp_bind(struct device *dev)
 		goto init_fail;
 
 	/* Set the CRTC's port so that the encoder component can find it */
-	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (!ep) {
-		ret = -EINVAL;
-		goto port_fail;
-	}
-	malidp->crtc.port = of_get_next_parent(ep);
+	malidp->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
 
 	ret = component_bind_all(dev, drm);
 	if (ret) {
@@ -418,9 +412,7 @@ static int malidp_bind(struct device *dev)
 irq_init_fail:
 	component_unbind_all(dev, drm);
 bind_fail:
-	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-port_fail:
 	malidp_fini(drm);
 init_fail:
 	drm->dev_private = NULL;
@@ -478,29 +470,16 @@ static int malidp_compare_dev(struct device *dev, void *data)
 
 static int malidp_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *port, *ep;
+	struct device_node *port;
 	struct component_match *match = NULL;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
 	/* there is only one output port inside each device, find it */
-	ep = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
-	if (!ep)
-		return -ENODEV;
-
-	if (!of_device_is_available(ep)) {
-		of_node_put(ep);
+	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
+	if (!port)
 		return -ENODEV;
-	}
-
-	/* add the remote encoder port as component */
-	port = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-	if (!port || !of_device_is_available(port)) {
-		of_node_put(port);
-		return -EAGAIN;
-	}
 
 	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
 				   port);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 8b210373cfa2..ac804f81e2f6 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -232,7 +232,6 @@ void adv7533_detach_dsi(struct adv7511 *adv)
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 {
 	u32 num_lanes;
-	struct device_node *endpoint;
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
@@ -241,17 +240,10 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 
 	adv->num_dsi_lanes = num_lanes;
 
-	endpoint = of_graph_get_next_endpoint(np, NULL);
-	if (!endpoint)
+	adv->host_node = of_graph_get_remote_node(np, 0, 0);
+	if (!adv->host_node)
 		return -ENODEV;
 
-	adv->host_node = of_graph_get_remote_port_parent(endpoint);
-	if (!adv->host_node) {
-		of_node_put(endpoint);
-		return -ENODEV;
-	}
-
-	of_node_put(endpoint);
 	of_node_put(adv->host_node);
 
 	adv->use_timing_gen = !of_property_read_bool(np,
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index e5706981c934..47b4c99162ad 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -154,21 +154,12 @@ static const struct drm_bridge_funcs dumb_vga_bridge_funcs = {
 
 static struct i2c_adapter *dumb_vga_retrieve_ddc(struct device *dev)
 {
-	struct device_node *end_node, *phandle, *remote;
+	struct device_node *phandle, *remote;
 	struct i2c_adapter *ddc;
 
-	end_node = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
-	if (!end_node) {
-		dev_err(dev, "Missing connector endpoint\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	remote = of_graph_get_remote_port_parent(end_node);
-	of_node_put(end_node);
-	if (!remote) {
-		dev_err(dev, "Enable to parse remote node\n");
+	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
+	if (!remote)
 		return ERR_PTR(-EINVAL);
-	}
 
 	phandle = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	of_node_put(remote);
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b054ea349952..82a6bdbf6ad0 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -127,18 +127,13 @@ static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 
 static int tfp410_get_connector_ddc(struct tfp410 *dvi)
 {
-	struct device_node *ep = NULL, *connector_node = NULL;
-	struct device_node *ddc_phandle = NULL;
+	struct device_node *connector_node, *ddc_phandle;
 	int ret = 0;
 
 	/* port@1 is the connector node */
-	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 1, -1);
-	if (!ep)
-		goto fail;
-
-	connector_node = of_graph_get_remote_port_parent(ep);
+	connector_node = of_graph_get_remote_node(dvi->dev->of_node, 1, -1);
 	if (!connector_node)
-		goto fail;
+		return -ENODEV;
 
 	ddc_phandle = of_parse_phandle(connector_node, "ddc-i2c-bus", 0);
 	if (!ddc_phandle)
@@ -150,10 +145,10 @@ static int tfp410_get_connector_ddc(struct tfp410 *dvi)
 	else
 		ret = -EPROBE_DEFER;
 
+	of_node_put(ddc_phandle);
+
 fail:
-	of_node_put(ep);
 	of_node_put(connector_node);
-	of_node_put(ddc_phandle);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index ad6b73c7fc59..eea529cea19a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -164,27 +164,13 @@ enum {
 	FIMD_PORT_WRB,
 };
 
-static struct device_node *exynos_dpi_of_find_panel_node(struct device *dev)
-{
-	struct device_node *np, *ep;
-
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, FIMD_PORT_RGB, 0);
-	if (!ep)
-		return NULL;
-
-	np = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-
-	return np;
-}
-
 static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 {
 	struct device *dev = ctx->dev;
 	struct device_node *dn = dev->of_node;
 	struct device_node *np;
 
-	ctx->panel_node = exynos_dpi_of_find_panel_node(dev);
+	ctx->panel_node = of_graph_get_remote_node(dn, FIMD_PORT_RGB, 0);
 
 	np = of_get_child_by_name(dn, "display-timings");
 	if (np) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e07cb1fe4860..04528f512c91 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1670,17 +1670,10 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 
 	of_node_put(ep);
 
-	ep = of_graph_get_next_endpoint(node, NULL);
-	if (!ep) {
-		ret = -EINVAL;
-		goto end;
-	}
+	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
+	if (!dsi->bridge_node)
+		return -EINVAL;
 
-	dsi->bridge_node = of_graph_get_remote_port_parent(ep);
-	if (!dsi->bridge_node) {
-		ret = -EINVAL;
-		goto end;
-	}
 end:
 	of_node_put(ep);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index a0def0be6d65..93ebb12133e1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -228,29 +228,6 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
 	writel(reg, mic->reg + MIC_OP);
 }
 
-static struct device_node *get_remote_node(struct device_node *from, int reg)
-{
-	struct device_node *endpoint = NULL, *remote_node = NULL;
-
-	endpoint = of_graph_get_endpoint_by_regs(from, reg, -1);
-	if (!endpoint) {
-		DRM_ERROR("mic: Failed to find remote port from %s",
-				from->full_name);
-		goto exit;
-	}
-
-	remote_node = of_graph_get_remote_port_parent(endpoint);
-	if (!remote_node) {
-		DRM_ERROR("mic: Failed to find remote port parent from %s",
-							from->full_name);
-		goto exit;
-	}
-
-exit:
-	of_node_put(endpoint);
-	return remote_node;
-}
-
 static int parse_dt(struct exynos_mic *mic)
 {
 	int ret = 0, i, j;
@@ -262,7 +239,7 @@ static int parse_dt(struct exynos_mic *mic)
 	 * The first node must be for decon and the second one must be for dsi.
 	 */
 	for (i = 0, j = 0; i < NUM_ENDPOINTS; i++) {
-		remote_node = get_remote_node(mic->dev->of_node, i);
+		remote_node = of_graph_get_remote_node(mic->dev->of_node, i, 0);
 		if (!remote_node) {
 			ret = -EPIPE;
 			goto exit;
@@ -279,7 +256,7 @@ static int parse_dt(struct exynos_mic *mic)
 			break;
 		case ENDPOINT_DSI_NODE:
 			/* panel node */
-			remote_node = get_remote_node(remote_node, 1);
+			remote_node = of_graph_get_remote_node(remote_node, 1, 0);
 			if (!remote_node) {
 				ret = -EPIPE;
 				goto exit;
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 998452ad0fcb..4ed6b5fef3b7 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -757,34 +757,16 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *endpoint, *bridge_node;
-	struct drm_bridge *bridge;
+	struct device_node *bridge_node;
 	struct resource *res;
 
 	/*
 	 * Get the endpoint node. In our case, dsi has one output port1
 	 * to which the external HDMI bridge is connected.
 	 */
-	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
-	if (!endpoint) {
-		DRM_ERROR("no valid endpoint node\n");
-		return -ENODEV;
-	}
-	of_node_put(endpoint);
-
-	bridge_node = of_graph_get_remote_port_parent(endpoint);
-	if (!bridge_node) {
-		DRM_ERROR("no valid bridge node\n");
-		return -ENODEV;
-	}
-	of_node_put(bridge_node);
-
-	bridge = of_drm_find_bridge(bridge_node);
-	if (!bridge) {
-		DRM_INFO("wait for external HDMI bridge driver.\n");
-		return -EPROBE_DEFER;
-	}
-	dsi->bridge = bridge;
+	ret = drm_of_find_panel_or_bridge(np, NULL, &dsi->bridge);
+	if (ret)
+		return ret;
 
 	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(ctx->pclk)) {
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index ebd5f4fe4c23..18d6570e057d 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -247,34 +247,6 @@ static const struct component_master_ops kirin_drm_ops = {
 	.unbind = kirin_drm_unbind,
 };
 
-static struct device_node *kirin_get_remote_node(struct device_node *np)
-{
-	struct device_node *endpoint, *remote;
-
-	/* get the first endpoint, in our case only one remote node
-	 * is connected to display controller.
-	 */
-	endpoint = of_graph_get_next_endpoint(np, NULL);
-	if (!endpoint) {
-		DRM_ERROR("no valid endpoint node\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	remote = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!remote) {
-		DRM_ERROR("no valid remote node\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	if (!of_device_is_available(remote)) {
-		DRM_ERROR("not available for remote node\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	return remote;
-}
-
 static int kirin_drm_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -288,7 +260,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	remote = kirin_get_remote_node(np);
+	remote = of_graph_get_remote_node(np, 0, 0);
 	if (IS_ERR(remote))
 		return PTR_ERR(remote);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 90fb831ef031..dbd554c09a39 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -661,7 +661,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_dpi *dpi;
 	struct resource *mem;
-	struct device_node *ep, *bridge_node = NULL;
+	struct device_node *bridge_node;
 	int comp_id;
 	int ret;
 
@@ -706,15 +706,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (ep) {
-		bridge_node = of_graph_get_remote_port_parent(ep);
-		of_node_put(ep);
-	}
-	if (!bridge_node) {
-		dev_err(dev, "Failed to find bridge node\n");
+	bridge_node = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (!bridge_node)
 		return -ENODEV;
-	}
 
 	dev_info(dev, "Found bridge node: %s\n", bridge_node->full_name);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0e8c4d9af340..f14e472812ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1433,7 +1433,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *port, *ep, *remote, *i2c_np;
+	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
 	struct resource *mem;
@@ -1485,29 +1485,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-	port = of_graph_get_port_by_id(np, 1);
-	if (!port) {
-		dev_err(dev, "Missing output port node\n");
+	remote = of_graph_get_remote_node(np, 1, 0);
+	if (!remote)
 		return -EINVAL;
-	}
-
-	ep = of_get_child_by_name(port, "endpoint");
-	if (!ep) {
-		dev_err(dev, "Missing endpoint node in port %s\n",
-			port->full_name);
-		of_node_put(port);
-		return -EINVAL;
-	}
-	of_node_put(port);
-
-	remote = of_graph_get_remote_port_parent(ep);
-	if (!remote) {
-		dev_err(dev, "Missing connector/bridge node for endpoint %s\n",
-			ep->full_name);
-		of_node_put(ep);
-		return -EINVAL;
-	}
-	of_node_put(ep);
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
 		hdmi->bridge.next = of_drm_find_bridge(remote);
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index ff1f6019b97b..37cb9c755ed7 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -163,14 +163,14 @@ static struct drm_driver meson_driver = {
 
 static bool meson_vpu_has_available_connectors(struct device *dev)
 {
-	struct device_node *ep, *remote;
+	struct device_node *remote;
+	int i;
 
-	/* Parses each endpoint and check if remote exists */
-	for_each_endpoint_of_node(dev->of_node, ep) {
-		/* If the endpoint node exists, consider it enabled */
-		remote = of_graph_get_remote_port(ep);
-		if (remote)
+	for_each_of_graph_remote_node(dev->of_node, remote, i, 2) {
+		if (remote) {
+			of_node_put(remote);
 			return true;
+		}
 	}
 
 	return false;
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index a2bcc70a03ef..8566de2edb62 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -217,25 +217,14 @@ static const struct drm_encoder_helper_funcs
 
 static bool meson_venc_cvbs_connector_is_available(struct meson_drm *priv)
 {
-	struct device_node *ep, *remote;
+	struct device_node *remote;
 
-	/* CVBS VDAC output is on the first port, first endpoint */
-	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
-	if (!ep)
+	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
+	if (!remote)
 		return false;
 
-
-	/* If the endpoint node exists, consider it enabled */
-	remote = of_graph_get_remote_port(ep);
-	if (remote) {
-		of_node_put(ep);
-		return true;
-	}
-
-	of_node_put(ep);
 	of_node_put(remote);
-
-	return false;
+	return true;
 }
 
 int meson_venc_cvbs_create(struct meson_drm *priv)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3819fdefcae2..da8619f9eb2e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1637,9 +1637,8 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 	}
 
 	/* Get panel node from the output port's endpoint data */
-	device_node = of_graph_get_remote_port_parent(endpoint);
+	device_node = of_graph_get_remote_node(np, 1, 0);
 	if (!device_node) {
-		dev_err(dev, "%s: no valid device\n", __func__);
 		ret = -ENODEV;
 		goto err;
 	}
diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index b782efd4b95f..9f36fad1915e 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -225,32 +225,6 @@ int mdp4_enable(struct mdp4_kms *mdp4_kms)
 	return 0;
 }
 
-static struct device_node *mdp4_detect_lcdc_panel(struct drm_device *dev)
-{
-	struct device_node *endpoint, *panel_node;
-	struct device_node *np = dev->dev->of_node;
-
-	/*
-	 * LVDS/LCDC is the first port described in the list of ports in the
-	 * MDP4 DT node.
-	 */
-	endpoint = of_graph_get_endpoint_by_regs(np, 0, -1);
-	if (!endpoint) {
-		DBG("no LVDS remote endpoint\n");
-		return NULL;
-	}
-
-	panel_node = of_graph_get_remote_port_parent(endpoint);
-	if (!panel_node) {
-		DBG("no valid panel node in LVDS endpoint\n");
-		of_node_put(endpoint);
-		return NULL;
-	}
-
-	of_node_put(endpoint);
-
-	return panel_node;
-}
 
 static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 				  int intf_type)
@@ -270,7 +244,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		 * bail out early if there is no panel node (no need to
 		 * initialize LCDC encoder and LVDS connector)
 		 */
-		panel_node = mdp4_detect_lcdc_panel(dev);
+		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
 		if (!panel_node)
 			return 0;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 2390c8577617..5e7ccd04ada6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -373,19 +373,13 @@ static void rockchip_add_endpoints(struct device *dev,
 				   struct component_match **match,
 				   struct device_node *port)
 {
-	struct device_node *ep, *remote;
+	struct device_node *remote;
+	int i;
 
-	for_each_child_of_node(port, ep) {
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!remote || !of_device_is_available(remote)) {
-			of_node_put(remote);
-			continue;
-		} else if (!of_device_is_available(remote->parent)) {
-			dev_warn(dev, "parent device of %s is not available\n",
-				 remote->full_name);
-			of_node_put(remote);
+	for (i = 0; i < 3; i++) {
+		remote = of_graph_get_remote_node(port, 0, i);
+		if (!remote)
 			continue;
-		}
 
 		drm_of_component_match_add(dev, match, compare_of, remote);
 		of_node_put(remote);
@@ -464,7 +458,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		rockchip_add_endpoints(dev, &match, port);
+		rockchip_add_endpoints(dev, &match, port->parent);
 		of_node_put(port);
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 6dfdb145f3bb..e74cc236a79b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -1013,16 +1013,7 @@ int tilcdc_crtc_create(struct drm_device *dev)
 	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
 
 	if (priv->is_componentized) {
-		struct device_node *ports =
-			of_get_child_by_name(dev->dev->of_node, "ports");
-
-		if (ports) {
-			crtc->port = of_get_child_by_name(ports, "port");
-			of_node_put(ports);
-		} else {
-			crtc->port =
-				of_get_child_by_name(dev->dev->of_node, "port");
-		}
+		crtc->port = of_graph_get_port_by_id(dev->dev->of_node, 0, 0);
 		if (!crtc->port) { /* This should never happen */
 			dev_err(dev->dev, "Port node not found in %s\n",
 				dev->dev->of_node->full_name);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index c67d7cd7d57e..b7523dce4e8a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -187,39 +187,6 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	return ret;
 }
 
-static int tilcdc_node_has_port(struct device_node *dev_node)
-{
-	struct device_node *node;
-
-	node = of_get_child_by_name(dev_node, "ports");
-	if (!node)
-		node = of_get_child_by_name(dev_node, "port");
-	if (!node)
-		return 0;
-	of_node_put(node);
-
-	return 1;
-}
-
-static
-struct device_node *tilcdc_get_remote_node(struct device_node *node)
-{
-	struct device_node *ep;
-	struct device_node *parent;
-
-	if (!tilcdc_node_has_port(node))
-		return NULL;
-
-	ep = of_graph_get_next_endpoint(node, NULL);
-	if (!ep)
-		return NULL;
-
-	parent = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-
-	return parent;
-}
-
 int tilcdc_attach_external_device(struct drm_device *ddev)
 {
 	struct tilcdc_drm_private *priv = ddev->dev_private;
@@ -227,7 +194,7 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	struct drm_bridge *bridge;
 	int ret;
 
-	remote_node = tilcdc_get_remote_node(ddev->dev->of_node);
+	remote_node = of_graph_get_remote_node(ddev->dev->of_node, 0, 0);
 	if (!remote_node)
 		return 0;
 
@@ -266,35 +233,18 @@ int tilcdc_get_external_components(struct device *dev,
 				   struct component_match **match)
 {
 	struct device_node *node;
-	struct device_node *ep = NULL;
-	int count = 0;
-	int ret = 0;
 
-	if (!tilcdc_node_has_port(dev->of_node))
+	if (!match)
 		return 0;
 
-	while ((ep = of_graph_get_next_endpoint(dev->of_node, ep))) {
-		node = of_graph_get_remote_port_parent(ep);
-		if (!node || !of_device_is_available(node)) {
-			of_node_put(node);
-			continue;
-		}
-
-		dev_dbg(dev, "Subdevice node '%s' found\n", node->name);
-
-		if (of_device_is_compatible(node, "nxp,tda998x")) {
-			if (match)
-				drm_of_component_match_add(dev, match,
-							   dev_match_of, node);
-			ret = 1;
-		}
+	node = of_graph_get_remote_node(dev->of_node, 0, 0);
 
+	if (!of_device_is_compatible(node, "nxp,tda998x")) {
 		of_node_put(node);
-		if (count++ > 1) {
-			dev_err(dev, "Only one port is supported\n");
-			return -EINVAL;
-		}
+		return 0;
 	}
 
-	return ret;
+	drm_of_component_match_add(dev, match, dev_match_of, node);
+	of_node_put(node);
+	return 1;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 1e1f6b8184d0..ac9655451b25 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -366,23 +366,14 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
  */
 static struct drm_panel *vc4_dpi_get_panel(struct device *dev)
 {
-	struct device_node *endpoint, *panel_node;
+	struct device_node *panel_node;
 	struct device_node *np = dev->of_node;
 	struct drm_panel *panel;
 
-	endpoint = of_graph_get_next_endpoint(np, NULL);
-	if (!endpoint) {
-		dev_err(dev, "no endpoint to fetch DPI panel\n");
-		return NULL;
-	}
-
 	/* don't proceed if we have an endpoint but no panel_node tied to it */
-	panel_node = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!panel_node) {
-		dev_err(dev, "no valid panel node\n");
+	panel_node = of_graph_get_remote_node(np, 0, 0);
+	if (!panel_node)
 		return NULL;
-	}
 
 	panel = of_drm_find_panel(panel_node);
 	of_node_put(panel_node);
-- 
2.10.1
