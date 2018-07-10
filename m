From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 07/18] drm/sun4i: DW HDMI: Release nodes if
 error happens during CRTC search
Date: Tue, 10 Jul 2018 22:35:00 +0200
Message-ID: <20180710203511.18454-8-jernej.skrabec@siol.net>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBG5RSTNAKGQERBZXTAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180710203511.18454-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

If error happens in sun8i_dw_hdmi_find_possible_crtcs(), nodes are not
released with of_node_put() before returning.

Fix that by calling of_node_put() when necessary. While on it, clean up
the code by using of_graph_get_remote_node() which also lowers number of
cases where error handling has to be performed.

Fixes: 57e23de02f48 ("drm/sun4i: DW HDMI: Expand algorithm for possible crtcs")

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 3459b9ec56c9..21dc9ebad0b4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -53,22 +53,14 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
 	struct device_node *port, *ep, *remote, *remote_port;
 	u32 crtcs = 0;
 
-	port = of_graph_get_port_by_id(node, 0);
-	if (!port)
-		return 0;
-
-	ep = of_get_next_available_child(port, NULL);
-	if (!ep)
-		return 0;
-
-	remote = of_graph_get_remote_port_parent(ep);
+	remote = of_graph_get_remote_node(node, 0, -1);
 	if (!remote)
 		return 0;
 
 	if (sun8i_dw_hdmi_node_is_tcon_top(remote)) {
 		port = of_graph_get_port_by_id(remote, 4);
 		if (!port)
-			return 0;
+			goto crtcs_exit;
 
 		for_each_child_of_node(port, ep) {
 			remote_port = of_graph_get_remote_port(ep);
@@ -81,6 +73,9 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
 		crtcs = drm_of_find_possible_crtcs(drm, node);
 	}
 
+crtcs_exit:
+	of_node_put(remote);
+
 	return crtcs;
 }
 
-- 
2.18.0
