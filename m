From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 02/11] staging: imx-drm-core: use of_graph_parse_endpoint
Date: Wed,  5 Mar 2014 10:20:53 +0100
Message-ID: <1394011262-16849-3-git-send-email-p.zabel@pengutronix.de>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Using of_graph_parse_endpoint recovers the port id from an endpoint device
tree node. This just replaces an open coded read of the "reg" property.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/imx-drm/imx-drm-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/imx-drm/imx-drm-core.c b/drivers/staging/imx-drm/imx-drm-core.c
index ecfc88b..4144a75 100644
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
1.9.0.rc3
