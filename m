From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 17/29] drm/sun4i: dw-hdmi: Make mode_valid
 function configurable
Date: Sun,  7 Oct 2018 11:38:53 +0200
Message-ID: <20181007093905.11253-18-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB4NI47OQKGQE44LFQJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since it is not possible to access sun8i-dw-hdmi driver private data
inside mode_valid function, make it configurable. That way different
versions of HDMI controllers can set different function, depending on
it's limitations.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 18 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  6 ++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index ed2983770e9c..ec122136ee9d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -5,6 +5,7 @@
 
 #include <linux/component.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_of.h>
@@ -33,8 +34,8 @@ static const struct drm_encoder_funcs sun8i_dw_hdmi_encoder_funcs = {
 };
 
 static enum drm_mode_status
-sun8i_dw_hdmi_mode_valid(struct drm_connector *connector,
-			 const struct drm_display_mode *mode)
+sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
+			      const struct drm_display_mode *mode)
 {
 	if (mode->clock > 297000)
 		return MODE_CLOCK_HIGH;
@@ -102,6 +103,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	hdmi->dev = &pdev->dev;
 	encoder = &hdmi->encoder;
 
+	hdmi->quirks = of_device_get_match_data(dev);
+
 	encoder->possible_crtcs =
 		sun8i_dw_hdmi_find_possible_crtcs(drm, dev->of_node);
 	/*
@@ -168,7 +171,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	sun8i_hdmi_phy_init(hdmi->phy);
 
-	plat_data->mode_valid = &sun8i_dw_hdmi_mode_valid;
+	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->phy_ops = sun8i_hdmi_phy_get_ops();
 	plat_data->phy_name = "sun8i_dw_hdmi_phy";
 	plat_data->phy_data = hdmi->phy;
@@ -230,8 +233,15 @@ static int sun8i_dw_hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks = {
+	.mode_valid = sun8i_dw_hdmi_mode_valid_a83t,
+};
+
 static const struct of_device_id sun8i_dw_hdmi_dt_ids[] = {
-	{ .compatible = "allwinner,sun8i-a83t-dw-hdmi" },
+	{
+		.compatible = "allwinner,sun8i-a83t-dw-hdmi",
+		.data = &sun8i_a83t_quirks,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun8i_dw_hdmi_dt_ids);
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 7fdc1ecd2892..a645b8bc9f58 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -170,6 +170,11 @@ struct sun8i_hdmi_phy {
 	struct sun8i_hdmi_phy_variant	*variant;
 };
 
+struct sun8i_dw_hdmi_quirks {
+	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+					   const struct drm_display_mode *mode);
+};
+
 struct sun8i_dw_hdmi {
 	struct clk			*clk_tmds;
 	struct device			*dev;
@@ -178,6 +183,7 @@ struct sun8i_dw_hdmi {
 	struct sun8i_hdmi_phy		*phy;
 	struct dw_hdmi_plat_data	plat_data;
 	struct regulator		*regulator;
+	const struct sun8i_dw_hdmi_quirks *quirks;
 	struct reset_control		*rst_ctrl;
 };
 
-- 
2.19.0
