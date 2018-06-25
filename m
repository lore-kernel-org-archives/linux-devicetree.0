From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 07/24] drm/sun4i: Split out code for
 enumerating endpoints in output port
Date: Mon, 25 Jun 2018 14:02:47 +0200
Message-ID: <20180625120304.7543-8-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB3VUYPMQKGQE4HJBWMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Until now, each node has one input port and one output port. However,
with TCON TOP this is no longer true. It has 3 input and 3 output ports.

In order to prepare to this situation, split out the code which checks
all endpoints in input port and adds available components to fifo.

This patch doesn't do any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 84 +++++++++++++++++--------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e15fa2389e3f..20193d6f33ba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -231,12 +231,55 @@ struct endpoint_list {
 	DECLARE_KFIFO(fifo, struct device_node *, 16);
 };
 
+static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
+					 struct device_node *node,
+					 int port_id)
+{
+	struct device_node *ep, *remote, *port;
+
+	port = of_graph_get_port_by_id(node, port_id);
+	if (!port) {
+		DRM_DEBUG_DRIVER("No output to bind on port %d\n", port_id);
+		return;
+	}
+
+	for_each_available_child_of_node(port, ep) {
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote) {
+			DRM_DEBUG_DRIVER("Error retrieving the output node\n");
+			continue;
+		}
+
+		/*
+		 * If the node is our TCON, the first port is used for
+		 * panel or bridges, and will not be part of the
+		 * component framework.
+		 */
+		if (sun4i_drv_node_is_tcon(node)) {
+			struct of_endpoint endpoint;
+
+			if (of_graph_parse_endpoint(ep, &endpoint)) {
+				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
+				of_node_put(remote);
+				continue;
+			}
+
+			if (!endpoint.id) {
+				DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
+				of_node_put(remote);
+				continue;
+			}
+		}
+
+		kfifo_put(&list->fifo, remote);
+	}
+}
+
 static int sun4i_drv_add_endpoints(struct device *dev,
 				   struct endpoint_list *list,
 				   struct component_match **match,
 				   struct device_node *node)
 {
-	struct device_node *port, *ep, *remote;
 	int count = 0;
 
 	/*
@@ -272,43 +315,8 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 		count++;
 	}
 
-	/* Inputs are listed first, then outputs */
-	port = of_graph_get_port_by_id(node, 1);
-	if (!port) {
-		DRM_DEBUG_DRIVER("No output to bind\n");
-		return count;
-	}
-
-	for_each_available_child_of_node(port, ep) {
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			DRM_DEBUG_DRIVER("Error retrieving the output node\n");
-			continue;
-		}
-
-		/*
-		 * If the node is our TCON, the first port is used for
-		 * panel or bridges, and will not be part of the
-		 * component framework.
-		 */
-		if (sun4i_drv_node_is_tcon(node)) {
-			struct of_endpoint endpoint;
-
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
-			}
-		}
-
-		kfifo_put(&list->fifo, remote);
-	}
+	/* each node has at least one output */
+	sun4i_drv_traverse_endpoints(list, node, 1);
 
 	return count;
 }
-- 
2.18.0
