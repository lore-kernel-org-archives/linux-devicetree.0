From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 10/12] drm/exynos: dsi: add support for MIC driver as a
 bridge
Date: Fri, 10 Apr 2015 14:55:28 +0900
Message-ID: <1428645330-1043-11-git-send-email-human.hwang@samsung.com>
References: <1428645330-1043-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1428645330-1043-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

MIC must be initilized by MIPI DSI when it is being bound.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v2:
- None

Changes for v3:
- None

Changes for v4:
- None

Changes for v5:
- None
 .../devicetree/bindings/video/exynos_dsim.txt      | 23 ++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 24 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 11ccac9..0be0362 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -32,10 +32,19 @@ Video interfaces:
   Device node can contain video interface port nodes according to [2].
   The following are properties specific to those nodes:

-  port node:
-    - reg: (required) can be 0 for input RGB/I80 port or 1 for DSI port;
+  port node inbound:
+    - reg: (required) must be 0.
+  port node outbound:
+    - reg: (required) must be 1.

-  endpoint node of DSI port (reg = 1):
+  endpoint node connected from mic node (reg = 0):
+    - remote-endpoint: specifies the endpoint in mic node. This node is required
+		       for Exynos5433 mipi dsi. So mic can access to panel node
+		       thoughout this dsi node.
+  endpoint node connected to panel node (reg = 1):
+    - remote-endpoint: specifies the endpoint in panel node. This node is
+		       required in all kinds of exynos mipi dsi to represent
+		       the connection between mipi dsi and panel.
     - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
       mode
     - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
@@ -74,7 +83,15 @@ Example:
 			#address-cells = <1>;
 			#size-cells = <0>;

+			port@0 {
+				reg = <0>;
+				decon_to_mic: endpoint {
+					remote-endpoint = <&mic_to_decon>;
+				};
+			};
+
 			port@1 {
+				reg = <1>;
 				dsi_ep: endpoint {
 					reg = <0>;
 					samsung,burst-clock-frequency = <500000000>;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ddcb77e..d5a3baf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -20,6 +20,7 @@
 #include <linux/irq.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
+#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
@@ -286,6 +287,7 @@ struct exynos_dsi {
 	struct list_head transfer_list;

 	struct exynos_dsi_driver_data *driver_data;
+	struct device_node *bridge_node;
 };

 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1776,7 +1778,22 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)

 	ret = exynos_dsi_of_read_u32(ep, "samsung,esc-clock-frequency",
 				     &dsi->esc_clk_rate);
+	if (ret < 0)
+		goto end;
+
+	of_node_put(ep);
+
+	ep = of_graph_get_next_endpoint(node, NULL);
+	if (!ep) {
+		ret = -ENXIO;
+		goto end;
+	}

+	dsi->bridge_node = of_graph_get_remote_port_parent(ep);
+	if (!dsi->bridge_node) {
+		ret = -ENXIO;
+		goto end;
+	}
 end:
 	of_node_put(ep);

@@ -1789,6 +1806,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct exynos_drm_display *display = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = display_to_dsi(display);
 	struct drm_device *drm_dev = data;
+	struct drm_bridge *bridge;
 	int ret;

 	ret = exynos_drm_create_enc_conn(drm_dev, display);
@@ -1798,6 +1816,12 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		return ret;
 	}

+	bridge = of_drm_find_bridge(dsi->bridge_node);
+	if (bridge) {
+		display->encoder->bridge = bridge;
+		drm_bridge_attach(drm_dev, bridge);
+	}
+
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
