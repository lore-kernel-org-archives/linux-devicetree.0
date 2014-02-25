From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC PATCH v4 2/8] staging: imx-drm-core: use of_graph_parse_endpoint
Date: Tue, 25 Feb 2014 15:23:17 +0100
Message-ID: <1393338203-25051-3-git-send-email-p.zabel@pengutronix.de>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393338203-25051-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Using of_graph_parse_endpoint recovers the port id from an endpoint device
tree node. This just replaces an open coded read of the "reg" property.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/staging/imx-drm/imx-drm-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/imx-drm/imx-drm-core.c b/drivers/staging/imx-drm/imx-drm-core.c
index 01bc1cf..009805a 100644
--- a/drivers/staging/imx-drm/imx-drm-core.c
+++ b/drivers/staging/imx-drm/imx-drm-core.c
@@ -501,8 +501,9 @@ int imx_drm_encoder_get_mux_id(struct device_node *node,
 {
 	struct imx_drm_crtc *imx_crtc = imx_drm_find_crtc(encoder->crtc);
 	struct device_node *ep = NULL;
+	struct of_endpoint endpoint;
 	struct device_node *port;
-	int id, ret;
+	int ret;
 
 	if (!node || !imx_crtc)
 		return -EINVAL;
@@ -515,9 +516,8 @@ int imx_drm_encoder_get_mux_id(struct device_node *node,
 		port = of_graph_get_remote_port(ep);
 		of_node_put(port);
 		if (port == imx_crtc->port) {
-			ret = of_property_read_u32(ep->parent, "reg", &id);
-			of_node_put(ep);
-			return ret ? ret : id;
+			ret = of_graph_parse_endpoint(ep, &endpoint);
+			return ret ? ret : endpoint.id;
 		}
 	} while (ep);
 
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
