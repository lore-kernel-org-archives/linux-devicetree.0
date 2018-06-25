From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 10/24] drm/sun4i: tcon: Generalize engine
 search algorithm
Date: Mon, 25 Jun 2018 14:02:50 +0200
Message-ID: <20180625120304.7543-11-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB55UYPMQKGQEIAJU2BY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Current "old" method to find engine worked pretty well for DE2. However,
it doesn't work when TCON TOP is between  mixer (engine) and TCON. TCON
TOP has multiple input ports, but current engine search algorithm
expects only one.

This can be fixed by first looking for output port id and selecting
matching input by subtracting 1 for the next round. This work even if
there is only one input and output.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 08747fc3ee71..264bcc43da11 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -791,12 +791,14 @@ static int sun4i_tcon_init_regmap(struct device *dev,
  */
 static struct sunxi_engine *
 sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
-				struct device_node *node)
+				struct device_node *node,
+				u32 port_id)
 {
 	struct device_node *port, *ep, *remote;
 	struct sunxi_engine *engine = ERR_PTR(-EINVAL);
+	u32 reg = 0;
 
-	port = of_graph_get_port_by_id(node, 0);
+	port = of_graph_get_port_by_id(node, port_id);
 	if (!port)
 		return ERR_PTR(-EINVAL);
 
@@ -826,8 +828,20 @@ sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
 		if (remote == engine->node)
 			goto out_put_remote;
 
+	/*
+	 * According to device tree binding input ports have even id
+	 * number and output ports have odd id. Since component with
+	 * more than one input and one output (TCON TOP) exits, correct
+	 * remote input id has to be calculated by subtracting 1 from
+	 * remote output id. If this for some reason can't be done, 0
+	 * is used as input port id.
+	 */
+	port = of_graph_get_remote_port(ep);
+	if (!of_property_read_u32(port, "reg", &reg) && reg > 0)
+		reg -= 1;
+
 	/* keep looking through upstream ports */
-	engine = sun4i_tcon_find_engine_traverse(drv, remote);
+	engine = sun4i_tcon_find_engine_traverse(drv, remote, reg);
 
 out_put_remote:
 	of_node_put(remote);
@@ -950,7 +964,7 @@ static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv *drv,
 
 	/* Fallback to old method by traversing input endpoints */
 	of_node_put(port);
-	return sun4i_tcon_find_engine_traverse(drv, node);
+	return sun4i_tcon_find_engine_traverse(drv, node, 0);
 }
 
 static int sun4i_tcon_bind(struct device *dev, struct device *master,
-- 
2.18.0
