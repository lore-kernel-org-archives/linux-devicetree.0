From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 08/24] drm/sun4i: Add support for traversing
 graph with TCON TOP
Date: Mon, 25 Jun 2018 14:02:48 +0200
Message-ID: <20180625120304.7543-9-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB4NUYPMQKGQE4EZH7IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

TCON TOP is different from other nodes in graph by having 3 input and 3
output ports. Additionally, connection to TV TCON might lead back to
HDMI mux input port, creating loops.

Add support for traversing such graph.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 20193d6f33ba..e6c62c079146 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -26,6 +26,7 @@
 #include "sun4i_frontend.h"
 #include "sun4i_framebuffer.h"
 #include "sun4i_tcon.h"
+#include "sun8i_tcon_top.h"
 
 DEFINE_DRM_GEM_CMA_FOPS(sun4i_drv_fops);
 
@@ -197,6 +198,11 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return !!of_match_node(sun4i_tcon_of_table, node);
 }
 
+static bool sun4i_drv_node_is_tcon_top(struct device_node *node)
+{
+	return !!of_match_node(sun8i_tcon_top_of_table, node);
+}
+
 static int compare_of(struct device *dev, void *data)
 {
 	DRM_DEBUG_DRIVER("Comparing of node %pOF with %pOF\n",
@@ -258,6 +264,18 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 		if (sun4i_drv_node_is_tcon(node)) {
 			struct of_endpoint endpoint;
 
+			/*
+			 * TCON TOP is always probed before TCON. However, TCON
+			 * points back to TCON TOP when it is source for HDMI.
+			 * We have to skip it here to prevent infinite looping
+			 * between TCON TOP and TCON.
+			 */
+			if (sun4i_drv_node_is_tcon_top(remote)) {
+				DRM_DEBUG_DRIVER("TCON output endpoint is TCON TOP... skipping\n");
+				of_node_put(remote);
+				continue;
+			}
+
 			if (of_graph_parse_endpoint(ep, &endpoint)) {
 				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
 				of_node_put(remote);
@@ -318,6 +336,12 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	/* each node has at least one output */
 	sun4i_drv_traverse_endpoints(list, node, 1);
 
+	/* TCON TOP has second and third output */
+	if (sun4i_drv_node_is_tcon_top(node)) {
+		sun4i_drv_traverse_endpoints(list, node, 3);
+		sun4i_drv_traverse_endpoints(list, node, 5);
+	}
+
 	return count;
 }
 
-- 
2.18.0
