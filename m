From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 11/24] drm/sun4i: Don't check for LVDS and
 RGB when TCON has only ch1
Date: Mon, 25 Jun 2018 14:02:51 +0200
Message-ID: <20180625120304.7543-12-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB6VUYPMQKGQEYZXX5NA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

LVDS and RGB interfaces are always connected to TCONs which have channel
0. It doesn't make sense to try to init them on TV TCONs.

Add a check if TCON has channel 0 before trying to init LVDS or RGB
interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 264bcc43da11..761687ebacba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1106,23 +1106,25 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dotclock;
 	}
 
-	/*
-	 * If we have an LVDS panel connected to the TCON, we should
-	 * just probe the LVDS connector. Otherwise, just probe RGB as
-	 * we used to.
-	 */
-	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
-	if (of_device_is_compatible(remote, "panel-lvds"))
-		if (can_lvds)
-			ret = sun4i_lvds_init(drm, tcon);
+	if (tcon->quirks->has_channel_0) {
+		/*
+		 * If we have an LVDS panel connected to the TCON, we should
+		 * just probe the LVDS connector. Otherwise, just probe RGB as
+		 * we used to.
+		 */
+		remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+		if (of_device_is_compatible(remote, "panel-lvds"))
+			if (can_lvds)
+				ret = sun4i_lvds_init(drm, tcon);
+			else
+				ret = -EINVAL;
 		else
-			ret = -EINVAL;
-	else
-		ret = sun4i_rgb_init(drm, tcon);
-	of_node_put(remote);
+			ret = sun4i_rgb_init(drm, tcon);
+		of_node_put(remote);
 
-	if (ret < 0)
-		goto err_free_dotclock;
+		if (ret < 0)
+			goto err_free_dotclock;
+	}
 
 	if (tcon->quirks->needs_de_be_mux) {
 		/*
-- 
2.18.0
