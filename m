From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 9/15] drm/sun4i: tcon: Pass the encoder to the
 mode set functions
Date: Tue,  7 Mar 2017 09:56:28 +0100
Message-ID: <e7791e7b68ed5c05d1d84c590f920c3d0cb7fb3a.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWPL7HCQKGQEYKPXNCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The mode set function need some changes based on which encoder is being
used. Make sure we can differentiate between our encoders by passing the
encoder structure asking for the mode set.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_rgb.c  | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 4 ++--
 drivers/gpu/drm/sun4i/sun4i_tv.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 1147451eb993..1d4a59a44d04 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -173,7 +173,7 @@ static void sun4i_rgb_encoder_mode_set(struct drm_encoder *encoder,
 	struct sun4i_rgb *rgb = drm_encoder_to_sun4i_rgb(encoder);
 	struct sun4i_tcon *tcon = rgb->tcon;
 
-	sun4i_tcon0_mode_set(tcon, mode);
+	sun4i_tcon0_mode_set(tcon, encoder, mode);
 
 	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 7461ae107e54..d2335f109601 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -127,7 +127,7 @@ static int sun4i_tcon_get_clk_delay(struct drm_display_mode *mode,
 	return delay;
 }
 
-void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
+void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
 			  struct drm_display_mode *mode)
 {
 	unsigned int bp, hsync, vsync;
@@ -200,7 +200,7 @@ void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
 }
 EXPORT_SYMBOL(sun4i_tcon0_mode_set);
 
-void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
+void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
 			  struct drm_display_mode *mode)
 {
 	unsigned int bp, hsync, vsync;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index f636343a935d..95b7e76eb1f8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -190,9 +190,9 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable);
 /* Mode Related Controls */
 void sun4i_tcon_switch_interlace(struct sun4i_tcon *tcon,
 				 bool enable);
-void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
+void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
 			  struct drm_display_mode *mode);
-void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
+void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
 			  struct drm_display_mode *mode);
 
 #endif /* __SUN4I_TCON_H__ */
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 32ed5fdf0c4d..2d36df092a6a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -389,7 +389,7 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 	struct sun4i_tcon *tcon = drv->tcon;
 	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
 
-	sun4i_tcon1_mode_set(tcon, mode);
+	sun4i_tcon1_mode_set(tcon, encoder, mode);
 
 	/* Enable and map the DAC to the output */
 	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
-- 
git-series 0.8.11
