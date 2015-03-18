From: Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v3 7/7] drm/tilcdc: Decrement refcount of ep-node from of_graph_get_next_endpoint
Date: Wed, 18 Mar 2015 11:06:36 +0200
Message-ID: <94d78d61a58b9d1929e6d592d0d9eea899634875.1426668480.git.jsarha@ti.com>
References: <cover.1426668480.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <cover.1426668480.git.jsarha@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com
Cc: tomi.valkeinen@ti.com, rmk+kernel@arm.linux.org.uk, robdclark@gmail.com, moinejf@free.fr, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

This patch should be dropped/reverterd if/after "of: Decrement refcount
of previous endpoint in of_graph_get_next_endpoint" patch has been
merged.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 61f8aee..1dd6c20 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -83,6 +83,7 @@ int tilcdc_get_external_components(struct device *dev,
 		struct device_node *node;
 
 		node = of_graph_get_remote_port_parent(ep);
+		of_node_put(ep);
 		if (!node && !of_device_is_available(node)) {
 			of_node_put(node);
 			continue;
-- 
1.9.1

