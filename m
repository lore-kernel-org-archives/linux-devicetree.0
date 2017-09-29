From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 03/14] drm/sun4i: tcon: Add variant callback
 for TCON output muxing
Date: Fri, 29 Sep 2017 16:22:55 +0800
Message-ID: <20170929082306.16193-4-wens@csie.org>
References: <20170929082306.16193-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6EFXDHAKGQERKQ63VA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170929082306.16193-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Different SoCs have different muxing options and values for the TCON
outputs. Instead of stuffing every possibility in sun4i_tcon_set_mux(),
add a callback pointer to sun4i_tcon_quirks that each TCON variant
can use to provide muxing support.

The current muxing options in sun4i_tcon_set_mux() for sun5i-a13 are
moved to a new sun5i-specific callback function.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 45 ++++++++++++++++++++++++--------------
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e853dfe51389..7bf51abaee97 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -14,9 +14,12 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 
+#include <uapi/drm/drm_mode.h>
+
 #include <linux/component.h>
 #include <linux/ioport.h>
 #include <linux/of_address.h>
@@ -112,23 +115,13 @@ EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
 void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
 			struct drm_encoder *encoder)
 {
-	u32 val;
-
-	if (!tcon->quirks->has_unknown_mux)
-		return;
+	int ret = -ENOTSUPP;
 
-	if (channel != 1)
-		return;
-
-	if (encoder->encoder_type == DRM_MODE_ENCODER_TVDAC)
-		val = 1;
-	else
-		val = 0;
+	if (tcon->quirks->set_mux)
+		ret = tcon->quirks->set_mux(tcon, encoder);
 
-	/*
-	 * FIXME: Undocumented bits
-	 */
-	regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);
+	DRM_DEBUG_DRIVER("Muxing encoder %s to CRTC %s: %d\n",
+			 encoder->name, encoder->crtc->name, ret);
 }
 EXPORT_SYMBOL(sun4i_tcon_set_mux);
 
@@ -767,9 +760,27 @@ static int sun4i_tcon_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/* platform specific TCON muxing callbacks */
+static int sun5i_a13_tcon_set_mux(struct sun4i_tcon *tcon,
+				  struct drm_encoder *encoder)
+{
+	u32 val;
+
+	if (encoder->encoder_type == DRM_MODE_ENCODER_TVDAC)
+		val = 1;
+	else
+		val = 0;
+
+	/*
+	 * FIXME: Undocumented bits
+	 */
+	return regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);
+}
+
 static const struct sun4i_tcon_quirks sun5i_a13_quirks = {
-	.has_unknown_mux = true,
-	.has_channel_1	= true,
+	.has_unknown_mux	= true,
+	.has_channel_1		= true,
+	.set_mux		= sun5i_a13_tcon_set_mux,
 };
 
 static const struct sun4i_tcon_quirks sun6i_a31_quirks = {
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index 5a219d1ccc26..6e699cbcf768 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -145,10 +145,15 @@
 
 #define SUN4I_TCON_MAX_CHANNELS		2
 
+struct sun4i_tcon;
+
 struct sun4i_tcon_quirks {
 	bool	has_unknown_mux; /* sun5i has undocumented mux */
 	bool	has_channel_1;	/* a33 does not have channel 1 */
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
+
+	/* callback to handle tcon muxing options */
+	int	(*set_mux)(struct sun4i_tcon *, struct drm_encoder *);
 };
 
 struct sun4i_tcon {
-- 
2.14.2
