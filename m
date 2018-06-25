From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 22/24] drm/sun4i: DW HDMI: Expand algorithm
 for possible crtcs
Date: Mon, 25 Jun 2018 14:03:02 +0200
Message-ID: <20180625120304.7543-23-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBG5VYPMQKGQEUCFBTHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

drm_of_find_possible_crtcs() doesn't work when DW HDMI encoder is
connected to TCON (crtc) through mux in TCON TOP.

In that case TCON TOP HDMI mux input port has to be manually traversed
and checked if it matches any known crtc.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 46 ++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 9f40a44b456b..d443886e055b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -12,6 +12,7 @@
 #include <drm/drm_crtc_helper.h>
 
 #include "sun8i_dw_hdmi.h"
+#include "sun8i_tcon_top.h"
 
 static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 					   struct drm_display_mode *mode,
@@ -41,6 +42,48 @@ sun8i_dw_hdmi_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+static bool sun8i_dw_hdmi_node_is_tcon_top(struct device_node *node)
+{
+	return !!of_match_node(sun8i_tcon_top_of_table, node);
+}
+
+static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
+					     struct device_node *node)
+{
+	struct device_node *port, *ep, *remote, *remote_port;
+	u32 crtcs = 0;
+
+	port = of_graph_get_port_by_id(node, 0);
+	if (!port)
+		return 0;
+
+	ep = of_get_next_available_child(port, NULL);
+	if (!ep)
+		return 0;
+
+	remote = of_graph_get_remote_port_parent(ep);
+	if (!remote)
+		return 0;
+
+	if (sun8i_dw_hdmi_node_is_tcon_top(remote)) {
+		port = of_graph_get_port_by_id(remote, 4);
+		if (!port)
+			return 0;
+
+		for_each_child_of_node(port, ep) {
+			remote_port = of_graph_get_remote_port(ep);
+			if (remote_port) {
+				crtcs |= drm_crtc_port_mask(drm, remote_port);
+				of_node_put(remote_port);
+			}
+		}
+	} else {
+		crtcs = drm_of_find_possible_crtcs(drm, node);
+	}
+
+	return crtcs;
+}
+
 static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -63,7 +106,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	hdmi->dev = &pdev->dev;
 	encoder = &hdmi->encoder;
 
-	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+	encoder->possible_crtcs =
+		sun8i_dw_hdmi_find_possible_crtcs(drm, dev->of_node);
 	/*
 	 * If we failed to find the CRTC(s) which this encoder is
 	 * supposed to be connected to, it's because the CRTC has
-- 
2.18.0
