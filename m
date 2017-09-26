From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 03/13] drm/sun4i: tcon: Add support for
 demuxing TCON output on A31
Date: Tue, 26 Sep 2017 14:59:09 +0800
Message-ID: <20170926065919.24446-4-wens@csie.org>
References: <20170926065919.24446-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUPVU7HAKGQETMVSATA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170926065919.24446-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On systems with 2 TCONs such as the A31, it is possible to demux the
output of the TCONs to one encoder.

Add support for this for the A31.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e853dfe51389..770b843a6fa9 100644
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
@@ -109,11 +112,69 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable)
 }
 EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
 
+static struct sun4i_tcon *sun4i_get_first_tcon(struct drm_device *drm)
+{
+	struct sun4i_drv *drv = drm->dev_private;
+	struct sun4i_tcon *tcon;
+
+	list_for_each_entry(tcon, &drv->tcon_list, list)
+		if (tcon->id == 0)
+			return tcon;
+
+	dev_warn(drm->dev,
+		 "TCON0 not found, display output muxing may not work\n");
+
+	return tcon;
+}
+
+static int _sun6i_tcon_set_mux(struct drm_encoder *encoder)
+{
+	struct sun4i_tcon *tcon = sun4i_get_first_tcon(encoder->dev);
+	int tcon_id = drm_crtc_to_sun4i_crtc(encoder->crtc)->tcon->id;
+	u32 shift;
+
+	DRM_DEBUG_DRIVER("Muxing encoder %s to CRTC %s (TCON %d)\n",
+			 encoder->name, encoder->crtc->name, tcon_id);
+
+	/* Only 2 TCONs */
+	if (tcon_id >= 2)
+		return -EINVAL;
+
+	switch (encoder->encoder_type) {
+	case DRM_MODE_ENCODER_TMDS:
+		/* HDMI */
+		shift = 8;
+		break;
+	case DRM_MODE_ENCODER_DSI:
+		/* No MIPI DSI on A31s */
+		if (of_device_is_compatible(tcon->dev->of_node,
+					    "allwinner,sun6i-a31s-tcon"))
+			return -EINVAL;
+		shift = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(tcon->regs, SUN4I_TCON_MUX_CTRL_REG,
+			   0x3 << shift, tcon_id << shift);
+
+	return 0;
+}
+
 void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
 			struct drm_encoder *encoder)
 {
+	/* Get the device node of the display engine */
+	struct device_node *node = encoder->dev->dev->of_node;
 	u32 val;
 
+	if (of_device_is_compatible(node, "allwinner,sun6i-a31-display-engine") ||
+	    of_device_is_compatible(node, "allwinner,sun6i-a31s-display-engine")) {
+		_sun6i_tcon_set_mux(encoder);
+		return;
+	}
+
 	if (!tcon->quirks->has_unknown_mux)
 		return;
 
-- 
2.14.1
