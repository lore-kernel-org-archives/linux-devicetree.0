From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 12/18] drm/sun4i: tcon: Add another way for
 matching mixers with tcon
Date: Tue, 10 Jul 2018 22:35:05 +0200
Message-ID: <20180710203511.18454-13-jernej.skrabec@siol.net>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBJ5RSTNAKGQEXBJF5QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Till now, new way of matching engines with TCONs was reading their
respective ids and match them by those ids. However, with introduction
of TCON TOP, that might not be so straightforward anymore.
- there might be more TCONs that engines (mixers)
- TCON ids might have non-consecutive ids

Workaround that by matching mixer id with TCON index from TCON list.

For example, R40 has 2 mixers and 4 TCONs. Board designer can choose
2 outputs, which are connected to any of those 4 TCONs. As long as there
are only 2 TCONs enabled in DT, using index in list as alternative id,
will allow to match them with mixer 0 and 1.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 51 ++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 3fb084f802e2..44ec3a3d4d64 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -35,6 +35,7 @@
 #include "sun4i_rgb.h"
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
+#include "sun8i_tcon_top.h"
 #include "sunxi_engine.h"
 
 static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *encoder)
@@ -880,6 +881,36 @@ static struct sunxi_engine *sun4i_tcon_get_engine_by_id(struct sun4i_drv *drv,
 	return ERR_PTR(-EINVAL);
 }
 
+static bool sun4i_tcon_connected_to_tcon_top(struct device_node *node)
+{
+	struct device_node *remote;
+	bool ret = false;
+
+	remote = of_graph_get_remote_node(node, 0, -1);
+	if (remote) {
+		ret = !!of_match_node(sun8i_tcon_top_of_table, remote);
+		of_node_put(remote);
+	}
+
+	return ret;
+}
+
+static int sun4i_tcon_get_index(struct sun4i_drv *drv)
+{
+	struct list_head *pos;
+	int size = 0;
+
+	/*
+	 * Because TCON is added to the list at the end of the probe
+	 * (after this function is called), index of the current TCON
+	 * will be same as current TCON list size.
+	 */
+	list_for_each(pos, &drv->tcon_list)
+		++size;
+
+	return size;
+}
+
 /*
  * On SoCs with the old display pipeline design (Display Engine 1.0),
  * we assumed the TCON was always tied to just one backend. However
@@ -928,8 +959,24 @@ static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv *drv,
 	 * connections between the backend and TCON?
 	 */
 	if (of_get_child_count(port) > 1) {
-		/* Get our ID directly from an upstream endpoint */
-		int id = sun4i_tcon_of_get_id_from_port(port);
+		int id;
+
+		/*
+		 * When pipeline has the same number of TCONs and engines which
+		 * are represented by frontends/backends (DE1) or mixers (DE2),
+		 * we match them by their respective IDs. However, if pipeline
+		 * contains TCON TOP, chances are that there are either more
+		 * TCONs than engines (R40) or TCONs with non-consecutive ids.
+		 * (H6). In that case it's easier just use TCON index in list
+		 * as an id. That means that on R40, any 2 TCONs can be enabled
+		 * in DT out of 4 (there are 2 mixers). Due to the design of
+		 * TCON TOP, remaining 2 TCONs can't be connected to anything
+		 * anyway.
+		 */
+		if (sun4i_tcon_connected_to_tcon_top(node))
+			id = sun4i_tcon_get_index(drv);
+		else
+			id = sun4i_tcon_of_get_id_from_port(port);
 
 		/* Get our engine by matching our ID */
 		engine = sun4i_tcon_get_engine_by_id(drv, id);
-- 
2.18.0
