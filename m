From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 18/29] drm/sun4i: dw-hdmi: Add quirk for
 setting TMDS clock
Date: Sun,  7 Oct 2018 11:38:54 +0200
Message-ID: <20181007093905.11253-19-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB45I47OQKGQE7AE4S2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

It turns out that H6 HDMI BSP kernel driver doesn't change TMDS rate at
all. At this point it is not clear whether it is just not necessary or
it would cause some kind of issues.

Add a quirk for it.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 5 ++++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index ec122136ee9d..e9e93f174b35 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -165,7 +165,9 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 	}
 
-	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
+	if (hdmi->quirks->set_rate)
+		drm_encoder_helper_add(encoder,
+				       &sun8i_dw_hdmi_encoder_helper_funcs);
 	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
@@ -235,6 +237,7 @@ static int sun8i_dw_hdmi_remove(struct platform_device *pdev)
 
 static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks = {
 	.mode_valid = sun8i_dw_hdmi_mode_valid_a83t,
+	.set_rate = true,
 };
 
 static const struct of_device_id sun8i_dw_hdmi_dt_ids[] = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index a645b8bc9f58..f9eb663865a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -173,6 +173,7 @@ struct sun8i_hdmi_phy {
 struct sun8i_dw_hdmi_quirks {
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   const struct drm_display_mode *mode);
+	bool set_rate;
 };
 
 struct sun8i_dw_hdmi {
-- 
2.19.0
