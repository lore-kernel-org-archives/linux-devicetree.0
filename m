From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND v2 06/12] drm/sun4i: rgb: Add 1%
 tolerance to dclk frequency check when bridge is connected
Date: Sun,  3 Feb 2019 10:54:55 -0800
Message-ID: <20190203185501.8958-7-anarsoul@gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBLPS3TRAKGQECCXD2IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190203185501.8958-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Clock rate check that was added in commit bb43d40d7c83 ("drm/sun4i: rgb:
Validate the clock rate") prevents some panel and bridges from working with
sun4i driver.

Unfortunately, dotclock frequency for some modes are not achievable on
sunxi hardware, and there's a slight deviation in rate returned by
clk_round_rate(), so they fail this check.

Experiments show that panels and bridges work fine with this slight
deviation, e.g. Pinebook that uses ANX6345 bridge with 768p eDP panel
requests 73 MHz, gets 72.296MHz instead (0.96% difference) and works just
fine.

This patch adds a 1% tolerence to the dot clock check when bridge is
connected.

Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_rgb.c  | 16 ++++++++++------
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index f4a22689eb54..3f04446120f6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -61,6 +61,7 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 	u32 vsync = mode->vsync_end - mode->vsync_start;
 	unsigned long rate = mode->clock * 1000;
 	long rounded_rate;
+	long tolerance = 0;
 
 	DRM_DEBUG_DRIVER("Validating modes...\n");
 
@@ -95,10 +96,14 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 	tcon->dclk_min_div = 6;
 	tcon->dclk_max_div = 127;
 	rounded_rate = clk_round_rate(tcon->dclk, rate);
-	if (rounded_rate < rate)
+	if (tcon->bridge)
+		/* Check against a 1% tolerance for the dot clock for bridge */
+		tolerance = rate / 100;
+
+	if (rounded_rate < (rate - tolerance))
 		return MODE_CLOCK_LOW;
 
-	if (rounded_rate > rate)
+	if (rounded_rate > (rate + tolerance))
 		return MODE_CLOCK_HIGH;
 
 	DRM_DEBUG_DRIVER("Clock rate OK\n");
@@ -172,7 +177,6 @@ static struct drm_encoder_funcs sun4i_rgb_enc_funcs = {
 int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
 	struct sun4i_rgb *rgb;
 	int ret;
 
@@ -183,7 +187,7 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 	encoder = &rgb->encoder;
 
 	ret = drm_of_find_panel_or_bridge(tcon->dev->of_node, 1, 0,
-					  &tcon->panel, &bridge);
+					  &tcon->panel, &tcon->bridge);
 	if (ret) {
 		dev_info(drm->dev, "No panel or bridge found... RGB output disabled\n");
 		return 0;
@@ -225,8 +229,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 		}
 	}
 
-	if (bridge) {
-		ret = drm_bridge_attach(encoder, bridge, NULL);
+	if (tcon->bridge) {
+		ret = drm_bridge_attach(encoder, tcon->bridge, NULL);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't attach our bridge\n");
 			goto err_cleanup_connector;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index b5214d71610f..487cb070b25c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -258,6 +258,7 @@ struct sun4i_tcon {
 	struct reset_control		*lvds_rst;
 
 	struct drm_panel		*panel;
+	struct drm_bridge		*bridge;
 
 	/* Platform adjustments */
 	const struct sun4i_tcon_quirks	*quirks;
-- 
2.20.1
