From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 09/24] drm/sun4i: Don't skip TCONs if they
 don't have channel 0
Date: Mon, 25 Jun 2018 14:02:49 +0200
Message-ID: <20180625120304.7543-10-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB5FUYPMQKGQEAODKAYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
Because of that, all output endpoints on such TCON node will point to a
encoder which is part of component framework.

Correct current graph traversing algorithm in such way that it doesn't
skip output enpoints with id 0 on TV TCONs.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 52 +++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e6c62c079146..6ddf4eaccb40 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -198,6 +198,22 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return !!of_match_node(sun4i_tcon_of_table, node);
 }
 
+static bool sun4i_drv_node_is_tcon_with_ch0(struct device_node *node)
+{
+	const struct of_device_id *match;
+
+	match = of_match_node(sun4i_tcon_of_table, node);
+	if (match) {
+		struct sun4i_tcon_quirks *quirks;
+
+		quirks = (struct sun4i_tcon_quirks *)match->data;
+
+		return quirks->has_channel_0;
+	}
+
+	return false;
+}
+
 static bool sun4i_drv_node_is_tcon_top(struct device_node *node)
 {
 	return !!of_match_node(sun8i_tcon_top_of_table, node);
@@ -256,14 +272,7 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 			continue;
 		}
 
-		/*
-		 * If the node is our TCON, the first port is used for
-		 * panel or bridges, and will not be part of the
-		 * component framework.
-		 */
 		if (sun4i_drv_node_is_tcon(node)) {
-			struct of_endpoint endpoint;
-
 			/*
 			 * TCON TOP is always probed before TCON. However, TCON
 			 * points back to TCON TOP when it is source for HDMI.
@@ -276,16 +285,25 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 				continue;
 			}
 
-			if (of_graph_parse_endpoint(ep, &endpoint)) {
-				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
-				of_node_put(remote);
-				continue;
-			}
-
-			if (!endpoint.id) {
-				DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
-				of_node_put(remote);
-				continue;
+			/*
+			 * If the node is our TCON with channel 0, the first
+			 * port is used for panel or bridges, and will not be
+			 * part of the component framework.
+			 */
+			if (sun4i_drv_node_is_tcon_with_ch0(node)) {
+				struct of_endpoint endpoint;
+
+				if (of_graph_parse_endpoint(ep, &endpoint)) {
+					DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
+					of_node_put(remote);
+					continue;
+				}
+
+				if (!endpoint.id) {
+					DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
+					of_node_put(remote);
+					continue;
+				}
 			}
 		}
 
-- 
2.18.0
