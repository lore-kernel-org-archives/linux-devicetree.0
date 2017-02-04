From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/5] drm: convert drivers to use drm_of_find_panel_or_bridge
Date: Fri,  3 Feb 2017 21:36:34 -0600
Message-ID: <20170204033635.10250-5-robh@kernel.org>
References: <20170204033635.10250-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170204033635.10250-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

Similar to the previous commit, convert drivers open coding OF graph
parsing to use drm_of_find_panel_or_bridge instead.

This changes some error messages to debug messages (in the graph core).
Graph connections are often "no connects" depending on the particular
board, so we want to avoid spurious messages. Plus the kernel is not a
DT validator.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 64 ++++-------------
 drivers/gpu/drm/bridge/nxp-ptn3460.c             | 16 ++---
 drivers/gpu/drm/bridge/parade-ps8622.c           | 16 ++---
 drivers/gpu/drm/bridge/tc358767.c                | 27 +------
 drivers/gpu/drm/exynos/exynos_dp.c               | 35 ++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c        | 49 ++++---------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c     |  5 +-
 drivers/gpu/drm/imx/imx-ldb.c                    | 28 ++------
 drivers/gpu/drm/imx/parallel-display.c           | 35 ++-------
 drivers/gpu/drm/mediatek/mtk_dsi.c               | 23 ++----
 drivers/gpu/drm/mxsfb/mxsfb_out.c                | 36 ++--------
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 26 ++-----
 drivers/gpu/drm/sun4i/sun4i_rgb.c                | 17 ++---
 drivers/gpu/drm/sun4i/sun4i_tcon.c               | 90 ++----------------------
 14 files changed, 88 insertions(+), 379 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 6119b5085501..4614048a4935 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -22,7 +22,7 @@
 #include <linux/of_graph.h>
 
 #include <drm/drmP.h>
-#include <drm/drm_panel.h>
+#include <drm/drm_of.h>
 
 #include "atmel_hlcdc_dc.h"
 
@@ -152,29 +152,11 @@ static const struct drm_connector_funcs atmel_hlcdc_panel_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int atmel_hlcdc_check_endpoint(struct drm_device *dev,
-				      const struct of_endpoint *ep)
-{
-	struct device_node *np;
-	void *obj;
-
-	np = of_graph_get_remote_port_parent(ep->local_node);
-
-	obj = of_drm_find_panel(np);
-	if (!obj)
-		obj = of_drm_find_bridge(np);
-
-	of_node_put(np);
-
-	return obj ? 0 : -EPROBE_DEFER;
-}
-
 static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
-				       const struct of_endpoint *ep)
+				       const struct device_node *np)
 {
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct atmel_hlcdc_rgb_output *output;
-	struct device_node *np;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	int ret;
@@ -195,13 +177,11 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
 
 	output->encoder.possible_crtcs = 0x1;
 
-	np = of_graph_get_remote_port_parent(ep->local_node);
-
-	ret = -EPROBE_DEFER;
+	ret = drm_of_find_panel_or_bridge(np, 0, 0, &panel, &bridge);
+	if (ret)
+		return ret;
 
-	panel = of_drm_find_panel(np);
 	if (panel) {
-		of_node_put(np);
 		output->connector.dpms = DRM_MODE_DPMS_OFF;
 		output->connector.polled = DRM_CONNECTOR_POLL_CONNECT;
 		drm_connector_helper_add(&output->connector,
@@ -226,9 +206,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
 		return 0;
 	}
 
-	bridge = of_drm_find_bridge(np);
-	of_node_put(np);
-
 	if (bridge) {
 		output->encoder.bridge = bridge;
 		bridge->encoder = &output->encoder;
@@ -245,31 +222,14 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
 
 int atmel_hlcdc_create_outputs(struct drm_device *dev)
 {
-	struct device_node *ep_np = NULL;
-	struct of_endpoint ep;
+	struct device_node *remote;
 	int ret;
 
-	for_each_endpoint_of_node(dev->dev->of_node, ep_np) {
-		ret = of_graph_parse_endpoint(ep_np, &ep);
-		if (!ret)
-			ret = atmel_hlcdc_check_endpoint(dev, &ep);
-
-		if (ret) {
-			of_node_put(ep_np);
-			return ret;
-		}
-	}
-
-	for_each_endpoint_of_node(dev->dev->of_node, ep_np) {
-		ret = of_graph_parse_endpoint(ep_np, &ep);
-		if (!ret)
-			ret = atmel_hlcdc_attach_endpoint(dev, &ep);
-
-		if (ret) {
-			of_node_put(ep_np);
-			return ret;
-		}
-	}
+	remote = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
+	if (!remote)
+		return -ENODEV;
 
-	return 0;
+	ret = atmel_hlcdc_attach_endpoint(dev, remote);
+	of_node_put(remote);
+	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 27f98c518dde..351704390d02 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -20,8 +20,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_graph.h>
 
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include "drm_crtc.h"
@@ -292,7 +292,6 @@ static int ptn3460_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
-	struct device_node *endpoint, *panel_node;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -300,16 +299,9 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (endpoint) {
-		panel_node = of_graph_get_remote_port_parent(endpoint);
-		if (panel_node) {
-			ptn_bridge->panel = of_drm_find_panel(panel_node);
-			of_node_put(panel_node);
-			if (!ptn_bridge->panel)
-				return -EPROBE_DEFER;
-		}
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
+	if (ret)
+		return ret;
 
 	ptn_bridge->client = client;
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index ac8cc5b50d9f..1dcec3b97e67 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -22,10 +22,10 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include "drmP.h"
@@ -536,7 +536,6 @@ static int ps8622_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct device_node *endpoint, *panel_node;
 	struct ps8622_bridge *ps8622;
 	int ret;
 
@@ -544,16 +543,9 @@ static int ps8622_probe(struct i2c_client *client,
 	if (!ps8622)
 		return -ENOMEM;
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (endpoint) {
-		panel_node = of_graph_get_remote_port_parent(endpoint);
-		if (panel_node) {
-			ps8622->panel = of_drm_find_panel(panel_node);
-			of_node_put(panel_node);
-			if (!ps8622->panel)
-				return -EPROBE_DEFER;
-		}
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ps8622->panel, NULL);
+	if (ret)
+		return ret;
 
 	ps8622->client = client;
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index de9ffb49e9f6..5c26488e7a2d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1244,7 +1244,6 @@ static const struct regmap_config tc_regmap_config = {
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct device_node *ep;
 	struct tc_data *tc;
 	int ret;
 
@@ -1255,29 +1254,9 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->dev = dev;
 
 	/* port@2 is the output port */
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 2, -1);
-	if (ep) {
-		struct device_node *remote;
-
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_warn(dev, "endpoint %s not connected\n",
-				 ep->full_name);
-			of_node_put(ep);
-			return -ENODEV;
-		}
-		of_node_put(ep);
-		tc->panel = of_drm_find_panel(remote);
-		if (tc->panel) {
-			dev_dbg(dev, "found panel %s\n", remote->full_name);
-		} else {
-			dev_dbg(dev, "waiting for panel %s\n",
-				remote->full_name);
-			of_node_put(remote);
-			return -EPROBE_DEFER;
-		}
-		of_node_put(remote);
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &tc->panel, NULL);
+	if (ret)
+		return ret;
 
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 528229faffe4..376c941c5189 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -23,6 +23,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include <drm/bridge/analogix_dp.h>
@@ -215,8 +216,11 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = NULL, *endpoint = NULL;
+	struct device_node *np;
 	struct exynos_dp_device *dp;
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 			  GFP_KERNEL);
@@ -240,28 +244,13 @@ static int exynos_dp_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (endpoint) {
-		np = of_graph_get_remote_port_parent(endpoint);
-		if (np) {
-			/* The remote port can be either a panel or a bridge */
-			dp->plat_data.panel = of_drm_find_panel(np);
-			if (!dp->plat_data.panel) {
-				dp->ptn_bridge = of_drm_find_bridge(np);
-				if (!dp->ptn_bridge) {
-					of_node_put(np);
-					return -EPROBE_DEFER;
-				}
-			}
-			of_node_put(np);
-		} else {
-			DRM_ERROR("no remote endpoint device node found.\n");
-			return -EINVAL;
-		}
-	} else {
-		DRM_ERROR("no port endpoint subnode found.\n");
-		return -EINVAL;
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
+	if (ret)
+		return ret;
+
+	/* The remote port can be either a panel or a bridge */
+	dp->plat_data.panel = panel;
+	dp->ptn_bridge = bridge;
 
 out:
 	return component_add(&pdev->dev, &exynos_dp_ops);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 05a8ee106879..3cae7dd75834 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -15,6 +15,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include "fsl_dcu_drm_drv.h"
@@ -141,35 +142,11 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 	return ret;
 }
 
-static int fsl_dcu_attach_endpoint(struct fsl_dcu_drm_device *fsl_dev,
-				   const struct of_endpoint *ep)
-{
-	struct drm_bridge *bridge;
-	struct device_node *np;
-
-	np = of_graph_get_remote_port_parent(ep->local_node);
-
-	fsl_dev->connector.panel = of_drm_find_panel(np);
-	if (fsl_dev->connector.panel) {
-		of_node_put(np);
-		return fsl_dcu_attach_panel(fsl_dev, fsl_dev->connector.panel);
-	}
-
-	bridge = of_drm_find_bridge(np);
-	of_node_put(np);
-	if (!bridge)
-		return -ENODEV;
-
-	fsl_dev->encoder.bridge = bridge;
-	bridge->encoder = &fsl_dev->encoder;
-
-	return drm_bridge_attach(fsl_dev->drm, bridge);
-}
-
 int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 {
-	struct of_endpoint ep;
-	struct device_node *ep_node, *panel_node;
+	struct device_node *panel_node;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	/* This is for backward compatibility */
@@ -182,14 +159,16 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		return fsl_dcu_attach_panel(fsl_dev, fsl_dev->connector.panel);
 	}
 
-	ep_node = of_graph_get_next_endpoint(fsl_dev->np, NULL);
-	if (!ep_node)
-		return -ENODEV;
-
-	ret = of_graph_parse_endpoint(ep_node, &ep);
-	of_node_put(ep_node);
+	ret = drm_of_find_panel_or_bridge(fsl_dev->np, 0, 0, &panel, &bridge);
 	if (ret)
-		return -ENODEV;
+		return ret;
 
-	return fsl_dcu_attach_endpoint(fsl_dev, &ep);
+	if (panel) {
+		fsl_dev->connector.panel = panel;
+		return fsl_dcu_attach_panel(fsl_dev, panel);
+	}
+
+	fsl_dev->encoder.bridge = bridge;
+	bridge->encoder = &fsl_dev->encoder;
+	return drm_bridge_attach(fsl_dev->drm, bridge);
 }
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 4ed6b5fef3b7..0f23e2c55862 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -17,7 +17,6 @@
 
 #include <linux/clk.h>
 #include <linux/component.h>
-#include <linux/of_graph.h>
 
 #include <drm/drm_of.h>
 #include <drm/drm_crtc_helper.h>
@@ -757,14 +756,14 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *bridge_node;
 	struct resource *res;
+	int ret;
 
 	/*
 	 * Get the endpoint node. In our case, dsi has one output port1
 	 * to which the external HDMI bridge is connected.
 	 */
-	ret = drm_of_find_panel_or_bridge(np, NULL, &dsi->bridge);
+	ret = drm_of_find_panel_or_bridge(np, 0, 0, NULL, &dsi->bridge);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 516d06490465..e670993906b8 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -649,7 +649,7 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 
 	for_each_child_of_node(np, child) {
 		struct imx_ldb_channel *channel;
-		struct device_node *ep;
+		struct device_node *remote;
 		int bus_format;
 
 		ret = of_property_read_u32(child, "reg", &i);
@@ -673,27 +673,11 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 		 * The output port is port@4 with an external 4-port mux or
 		 * port@2 with the internal 2-port mux.
 		 */
-		ep = of_graph_get_endpoint_by_regs(child,
-						   imx_ldb->lvds_mux ? 4 : 2,
-						   -1);
-		if (ep) {
-			struct device_node *remote;
-
-			remote = of_graph_get_remote_port_parent(ep);
-			of_node_put(ep);
-			if (remote) {
-				channel->panel = of_drm_find_panel(remote);
-				channel->bridge = of_drm_find_bridge(remote);
-			} else
-				return -EPROBE_DEFER;
-			of_node_put(remote);
-
-			if (!channel->panel && !channel->bridge) {
-				dev_err(dev, "panel/bridge not found: %s\n",
-					remote->full_name);
-				return -EPROBE_DEFER;
-			}
-		}
+		ret = drm_of_find_panel_or_bridge(fsl_dev->np,
+						  imx_ldb->lvds_mux ? 4 : 2, 0,
+						  &channel->panel, &channel->bridge);
+		if (ret)
+			return ret;
 
 		/* panel ddc only if there is no bridge */
 		if (!channel->bridge) {
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 8582a83c0d9b..eb3a0201853a 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -210,7 +210,7 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct device_node *np = dev->of_node;
-	struct device_node *ep;
+	struct device_node *remote;
 	const u8 *edidp;
 	struct imx_parallel_display *imxpd;
 	int ret;
@@ -239,36 +239,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	imxpd->bus_format = bus_format;
 
 	/* port@1 is the output port */
-	ep = of_graph_get_endpoint_by_regs(np, 1, -1);
-	if (ep) {
-		struct device_node *remote;
-
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_warn(dev, "endpoint %s not connected\n",
-				 ep->full_name);
-			of_node_put(ep);
-			return -ENODEV;
-		}
-		of_node_put(ep);
-
-		imxpd->panel = of_drm_find_panel(remote);
-		if (imxpd->panel) {
-			dev_dbg(dev, "found panel %s\n", remote->full_name);
-		} else {
-			imxpd->bridge = of_drm_find_bridge(remote);
-			if (imxpd->bridge)
-				dev_dbg(dev, "found bridge %s\n",
-					remote->full_name);
-		}
-		if (!imxpd->panel && !imxpd->bridge) {
-			dev_dbg(dev, "waiting for panel or bridge %s\n",
-				remote->full_name);
-			of_node_put(remote);
-			return -EPROBE_DEFER;
-		}
-		of_node_put(remote);
-	}
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel, &imxpd->bridge);
+	if (ret)
+		return ret;
 
 	imxpd->dev = dev;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 2c42f90809d8..14140579f8d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -16,11 +16,11 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_of.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <video/videomode.h>
@@ -819,7 +819,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct device_node *remote_node, *endpoint;
 	struct resource *regs;
 	int comp_id;
 	int ret;
@@ -831,22 +830,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (endpoint) {
-		remote_node = of_graph_get_remote_port_parent(endpoint);
-		if (!remote_node) {
-			dev_err(dev, "No panel connected\n");
-			return -ENODEV;
-		}
-
-		dsi->bridge = of_drm_find_bridge(remote_node);
-		dsi->panel = of_drm_find_panel(remote_node);
-		of_node_put(remote_node);
-		if (!dsi->bridge && !dsi->panel) {
-			dev_info(dev, "Waiting for bridge or panel driver\n");
-			return -EPROBE_DEFER;
-		}
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
+					  &dsi->panel, &dsi->bridge);
+	if (ret)
+		return ret;
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dsi->engine_clk)) {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
index fa8d17399407..f7d729aa09bd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_out.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -82,20 +83,15 @@ static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static int mxsfb_attach_endpoint(struct drm_device *drm,
-				 const struct of_endpoint *ep)
+int mxsfb_create_output(struct drm_device *drm)
 {
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
-	struct device_node *np;
 	struct drm_panel *panel;
-	int ret = -EPROBE_DEFER;
-
-	np = of_graph_get_remote_port_parent(ep->local_node);
-	panel = of_drm_find_panel(np);
-	of_node_put(np);
+	int ret;
 
-	if (!panel)
-		return -EPROBE_DEFER;
+	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel, NULL);
+	if (ret)
+		return ret;
 
 	mxsfb->connector.dpms = DRM_MODE_DPMS_OFF;
 	mxsfb->connector.polled = 0;
@@ -109,23 +105,3 @@ static int mxsfb_attach_endpoint(struct drm_device *drm,
 
 	return ret;
 }
-
-int mxsfb_create_output(struct drm_device *drm)
-{
-	struct device_node *ep_np = NULL;
-	struct of_endpoint ep;
-	int ret;
-
-	for_each_endpoint_of_node(drm->dev->of_node, ep_np) {
-		ret = of_graph_parse_endpoint(ep_np, &ep);
-		if (!ret)
-			ret = mxsfb_attach_endpoint(drm, &ep);
-
-		if (ret) {
-			of_node_put(ep_np);
-			return ret;
-		}
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8548e8271639..615afad280a8 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -428,31 +428,13 @@ static const struct component_ops rockchip_dp_component_ops = {
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node, *port, *endpoint;
 	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
+	int ret;
 
-	port = of_graph_get_port_by_id(dev->of_node, 1);
-	if (port) {
-		endpoint = of_get_child_by_name(port, "endpoint");
-		of_node_put(port);
-		if (!endpoint) {
-			dev_err(dev, "no output endpoint found\n");
-			return -EINVAL;
-		}
-
-		panel_node = of_graph_get_remote_port_parent(endpoint);
-		of_node_put(endpoint);
-		if (!panel_node) {
-			dev_err(dev, "no output node found\n");
-			return -EINVAL;
-		}
-
-		panel = of_drm_find_panel(panel_node);
-		of_node_put(panel_node);
-		if (!panel)
-			return -EPROBE_DEFER;
-	}
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret)
+		return ret;
 
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index f5e86fe7750e..4720725b0fb0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -15,6 +15,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include "sun4i_drv.h"
@@ -217,12 +218,10 @@ int sun4i_rgb_init(struct drm_device *drm)
 	rgb->drv = drv;
 	encoder = &rgb->encoder;
 
-	tcon->panel = sun4i_tcon_find_panel(tcon->dev->of_node);
-	encoder->bridge = sun4i_tcon_find_bridge(tcon->dev->of_node);
-	if (IS_ERR(tcon->panel) && IS_ERR(encoder->bridge)) {
-		dev_info(drm->dev, "No panel or bridge found... RGB output disabled\n");
-		return 0;
-	}
+	ret = drm_of_find_panel_or_bridge(tcon->dev->of_node, 1, 0,
+					  &tcon->panel, &encoder->bridge);
+	if (ret)
+		return ret;
 
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
@@ -239,7 +238,7 @@ int sun4i_rgb_init(struct drm_device *drm)
 	/* The RGB encoder can only work with the TCON channel 0 */
 	rgb->encoder.possible_crtcs = BIT(0);
 
-	if (!IS_ERR(tcon->panel)) {
+	if (tcon->panel) {
 		drm_connector_helper_add(&rgb->connector,
 					 &sun4i_rgb_con_helper_funcs);
 		ret = drm_connector_init(drm, &rgb->connector,
@@ -260,7 +259,7 @@ int sun4i_rgb_init(struct drm_device *drm)
 		}
 	}
 
-	if (!IS_ERR(encoder->bridge)) {
+	if (encoder->bridge) {
 		encoder->bridge->encoder = &rgb->encoder;
 
 		ret = drm_bridge_attach(drm, encoder->bridge);
@@ -268,8 +267,6 @@ int sun4i_rgb_init(struct drm_device *drm)
 			dev_err(drm->dev, "Couldn't attach our bridge\n");
 			goto err_cleanup_connector;
 		}
-	} else {
-		encoder->bridge = NULL;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index ea2906f87cb9..2e4e365cecf9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -15,13 +15,12 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_modes.h>
-#include <drm/drm_panel.h>
+#include <drm/drm_of.h>
 
 #include <linux/component.h>
 #include <linux/ioport.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -405,74 +404,6 @@ static int sun4i_tcon_init_regmap(struct device *dev,
 	return 0;
 }
 
-struct drm_panel *sun4i_tcon_find_panel(struct device_node *node)
-{
-	struct device_node *port, *remote, *child;
-	struct device_node *end_node = NULL;
-
-	/* Inputs are listed first, then outputs */
-	port = of_graph_get_port_by_id(node, 1);
-
-	/*
-	 * Our first output is the RGB interface where the panel will
-	 * be connected.
-	 */
-	for_each_child_of_node(port, child) {
-		u32 reg;
-
-		of_property_read_u32(child, "reg", &reg);
-		if (reg == 0)
-			end_node = child;
-	}
-
-	if (!end_node) {
-		DRM_DEBUG_DRIVER("Missing panel endpoint\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	remote = of_graph_get_remote_port_parent(end_node);
-	if (!remote) {
-		DRM_DEBUG_DRIVER("Unable to parse remote node\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	return of_drm_find_panel(remote) ?: ERR_PTR(-EPROBE_DEFER);
-}
-
-struct drm_bridge *sun4i_tcon_find_bridge(struct device_node *node)
-{
-	struct device_node *port, *remote, *child;
-	struct device_node *end_node = NULL;
-
-	/* Inputs are listed first, then outputs */
-	port = of_graph_get_port_by_id(node, 1);
-
-	/*
-	 * Our first output is the RGB interface where the panel will
-	 * be connected.
-	 */
-	for_each_child_of_node(port, child) {
-		u32 reg;
-
-		of_property_read_u32(child, "reg", &reg);
-		if (reg == 0)
-			end_node = child;
-	}
-
-	if (!end_node) {
-		DRM_DEBUG_DRIVER("Missing bridge endpoint\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	remote = of_graph_get_remote_port_parent(end_node);
-	if (!remote) {
-		DRM_DEBUG_DRIVER("Enable to parse remote node\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	return of_drm_find_bridge(remote) ?: ERR_PTR(-EPROBE_DEFER);
-}
-
 static int sun4i_tcon_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -555,22 +486,11 @@ static int sun4i_tcon_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
+	int ret;
 
-	/*
-	 * Neither the bridge or the panel is ready.
-	 * Defer the probe.
-	 */
-	panel = sun4i_tcon_find_panel(node);
-	bridge = sun4i_tcon_find_bridge(node);
-
-	/*
-	 * If we don't have a panel endpoint, just go on
-	 */
-	if ((PTR_ERR(panel) == -EPROBE_DEFER) &&
-	    (PTR_ERR(bridge) == -EPROBE_DEFER)) {
-		DRM_DEBUG_DRIVER("Still waiting for our panel/bridge. Deferring...\n");
-		return -EPROBE_DEFER;
-	}
+	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
+	if (ret == -EPROBE_DEFER)
+		return ret;
 
 	return component_add(&pdev->dev, &sun4i_tcon_ops);
 }
-- 
2.10.1
