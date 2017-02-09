From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 6/6] drm: omap: use common OF graph helpers
Date: Thu,  9 Feb 2017 13:05:58 -0600
Message-ID: <20170209190558.4784-7-robh@kernel.org>
References: <20170209190558.4784-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170209190558.4784-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

The OMAP driver has its own OF graph helpers that are similar to the
common helpers. This commit replaces most of the calls with the common
helpers. There's still a couple of custom helpers left, but the driver
needs more extensive changes to get rid of them.

In dss_init_ports, we invert the loop, looping through the known ports
and matching them to DT nodes rather than looping thru DT nodes and
matching them to the ports.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- build fixes in hdmi5 and sdi

 drivers/gpu/drm/omapdrm/dss/dpi.c     |   2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c     |   3 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c  | 102 +---------------------------------
 drivers/gpu/drm/omapdrm/dss/dss.c     |  61 +++++---------------
 drivers/gpu/drm/omapdrm/dss/hdmi4.c   |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c   |   3 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  11 ----
 drivers/gpu/drm/omapdrm/dss/sdi.c     |   2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c    |   3 +-
 9 files changed, 26 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index e75162d26ac0..e5bb494d4689 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -855,7 +855,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;

-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_get_next_child(port, NULL);
 	if (!ep)
 		return 0;

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index f060bda31235..d63e240513f1 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -39,6 +39,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>

@@ -5091,7 +5092,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;

-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
 		return 0;

diff --git a/drivers/gpu/drm/omapdrm/dss/dss-of.c b/drivers/gpu/drm/omapdrm/dss/dss-of.c
index dfd4e9621e3b..eb520ab45ddd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss-of.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss-of.c
@@ -16,77 +16,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/seq_file.h>

 #include "omapdss.h"
 #include "dss.h"

-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (of_node_cmp(port->name, "port") != 0);
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (of_node_cmp(ep->name, "endpoint") != 0);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
@@ -123,37 +58,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }

-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_parse_phandle(node, "remote-endpoint", 0);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port = omapdss_of_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep = omapdss_of_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -161,11 +65,11 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;

-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
 		return ERR_PTR(-EINVAL);

-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 14887d5b02e5..2734c401d9fa 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -38,6 +38,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -1043,32 +1044,14 @@ static int dss_init_ports(struct platform_device *pdev)
 {
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
-	int r;
-
-	if (parent == NULL)
-		return 0;
+	int i;

-	port = omapdss_of_get_next_port(parent, NULL);
-	if (!port)
-		return 0;
-
-	if (dss.feat->num_ports == 0)
-		return 0;
-
-	do {
-		enum omap_display_type port_type;
-		u32 reg;
-
-		r = of_property_read_u32(port, "reg", &reg);
-		if (r)
-			reg = 0;
-
-		if (reg >= dss.feat->num_ports)
+	for (i = 0; i < dss.feat->num_ports; i++) {
+		port = of_graph_get_port_by_id(parent, i);
+		if (!port)
 			continue;

-		port_type = dss.feat->ports[reg];
-
-		switch (port_type) {
+		switch (dss.feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
 			dpi_init_port(pdev, port);
 			break;
@@ -1078,7 +1061,7 @@ static int dss_init_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	}

 	return 0;
 }
@@ -1087,32 +1070,14 @@ static void dss_uninit_ports(struct platform_device *pdev)
 {
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
+	int i;

-	if (parent == NULL)
-		return;
-
-	port = omapdss_of_get_next_port(parent, NULL);
-	if (!port)
-		return;
-
-	if (dss.feat->num_ports == 0)
-		return;
-
-	do {
-		enum omap_display_type port_type;
-		u32 reg;
-		int r;
-
-		r = of_property_read_u32(port, "reg", &reg);
-		if (r)
-			reg = 0;
-
-		if (reg >= dss.feat->num_ports)
+	for (i = 0; i < dss.feat->num_ports; i++) {
+		port = of_graph_get_port_by_id(parent, i);
+		if (!port)
 			continue;

-		port_type = dss.feat->ports[reg];
-
-		switch (port_type) {
+		switch (dss.feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
 			dpi_uninit_port(port);
 			break;
@@ -1122,7 +1087,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	}
 }

 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e7162c16de2e..87c53034c634 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -34,6 +34,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <sound/omap-hdmi-audio.h>

 #include "omapdss.h"
@@ -546,7 +547,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;

-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
 		return 0;

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 678dfb02764a..d13dce7e8079 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -39,6 +39,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <sound/omap-hdmi-audio.h>

 #include "omapdss.h"
@@ -572,7 +573,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;

-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
 		return 0;

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index b420dde8c0fb..acf4e520baaf 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -830,17 +830,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }

-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);

diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index b3bda2d3c08d..0620b9f8c231 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -414,7 +414,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;

-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_get_next_child(port, NULL);
 	if (!ep)
 		return 0;

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index d74f7fcc2e46..19d14957f566 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -35,6 +35,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>

 #include "omapdss.h"
@@ -818,7 +819,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;

-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
 		return 0;

--
2.10.1
