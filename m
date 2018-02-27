From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 06/16] drm/sun4i: Don't process LVDS if TCON
 doesn't support it
Date: Tue, 27 Feb 2018 23:26:51 +0100
Message-ID: <20180227222701.9716-7-jernej.skrabec@siol.net>
References: <20180227222701.9716-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBXFW27KAKGQEERLSTMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180227222701.9716-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

TCON checks for LVDS properties even if it doesn't support it. Add a
check to skip that part of the code if TCON doesn't support channel 0.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 120 +++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0d6c5ed44795..3fae4f6e695a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -850,7 +850,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct sunxi_engine *engine;
 	struct device_node *remote;
 	struct sun4i_tcon *tcon;
-	bool has_lvds_rst, has_lvds_alt, can_lvds;
+	bool has_lvds_rst, has_lvds_alt, can_lvds = false;
 	int ret;
 
 	engine = sun4i_tcon_find_engine(drv, dev->of_node);
@@ -881,52 +881,56 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	/*
-	 * This can only be made optional since we've had DT nodes
-	 * without the LVDS reset properties.
-	 *
-	 * If the property is missing, just disable LVDS, and print a
-	 * warning.
-	 */
-	tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
-	if (IS_ERR(tcon->lvds_rst)) {
-		dev_err(dev, "Couldn't get our reset line\n");
-		return PTR_ERR(tcon->lvds_rst);
-	} else if (tcon->lvds_rst) {
-		has_lvds_rst = true;
-		reset_control_reset(tcon->lvds_rst);
-	} else {
-		has_lvds_rst = false;
-	}
+	if (tcon->quirks->has_channel_0) {
+		/*
+		 * This can only be made optional since we've had DT nodes
+		 * without the LVDS reset properties.
+		 *
+		 * If the property is missing, just disable LVDS, and print a
+		 * warning.
+		 */
+		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+		if (IS_ERR(tcon->lvds_rst)) {
+			dev_err(dev, "Couldn't get our reset line\n");
+			return PTR_ERR(tcon->lvds_rst);
+		} else if (tcon->lvds_rst) {
+			has_lvds_rst = true;
+			reset_control_reset(tcon->lvds_rst);
+		} else {
+			has_lvds_rst = false;
+		}
 
-	/*
-	 * This can only be made optional since we've had DT nodes
-	 * without the LVDS reset properties.
-	 *
-	 * If the property is missing, just disable LVDS, and print a
-	 * warning.
-	 */
-	if (tcon->quirks->has_lvds_alt) {
-		tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
-		if (IS_ERR(tcon->lvds_pll)) {
-			if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
-				has_lvds_alt = false;
+		/*
+		 * This can only be made optional since we've had DT nodes
+		 * without the LVDS reset properties.
+		 *
+		 * If the property is missing, just disable LVDS, and print a
+		 * warning.
+		 */
+		if (tcon->quirks->has_lvds_alt) {
+			tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
+			if (IS_ERR(tcon->lvds_pll)) {
+				if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
+					has_lvds_alt = false;
+				} else {
+					dev_err(dev,
+						"Couldn't get the LVDS PLL\n");
+					return PTR_ERR(tcon->lvds_pll);
+				}
 			} else {
-				dev_err(dev, "Couldn't get the LVDS PLL\n");
-				return PTR_ERR(tcon->lvds_pll);
+				has_lvds_alt = true;
 			}
-		} else {
-			has_lvds_alt = true;
 		}
-	}
 
-	if (!has_lvds_rst || (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
-		dev_warn(dev,
-			 "Missing LVDS properties, Please upgrade your DT\n");
-		dev_warn(dev, "LVDS output disabled\n");
-		can_lvds = false;
-	} else {
-		can_lvds = true;
+		if (!has_lvds_rst ||
+		    (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
+			dev_warn(dev,
+				 "Missing LVDS properties, Please upgrade your DT\n");
+			dev_warn(dev, "LVDS output disabled\n");
+			can_lvds = false;
+		} else {
+			can_lvds = true;
+		}
 	}
 
 	ret = sun4i_tcon_init_clocks(dev, tcon);
@@ -962,23 +966,25 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
2.16.2
