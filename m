From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 3/6] drm/sun4i: tcon: Add dithering support
 for RGB565/RGB666 LCD panels
Date: Fri,  7 Sep 2018 12:19:45 +0800
Message-ID: <20180907041948.19913-4-wens@csie.org>
References: <20180907041948.19913-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2HYY7OAKGQEKJYF6XA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180907041948.19913-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The hardware supports dithering on TCON channel 0 which is used for LCD
panels.

Dithering is a method of approximating a color from a mixture of other
colors when the required color isn't available. It reduces color
banding artifacts that can be observed when displaying gradients
(e.g. grayscale gradients). This may occur when the image that needs
to be displayed is 24-bit but the LCD panel is a lower bit depth and
does not perform dithering on its own.

Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
[wens-jdAy2FN1RRM@public.gmane.org: check display_info.bpc first; handle LVDS and MIPI DSI]
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 61 ++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index d6f9d5f3b15b..4834c90b4912 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -12,6 +12,7 @@
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_encoder.h>
@@ -277,6 +278,57 @@ static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
 		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
 }
 
+static void sun4i_tcon0_mode_set_dithering(struct sun4i_tcon *tcon,
+					   const struct drm_connector *connector)
+{
+	u32 bus_format = 0;
+	u32 val = 0;
+
+	/* XXX Would this ever happen? */
+	if (!connector)
+		return;
+
+	/*
+	 * FIXME: Undocumented bits
+	 *
+	 * The whole dithering process and these parameters are not
+	 * explained in the vendor documents or BSP kernel code.
+	 */
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PR_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PG_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PB_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LR_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LG_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LB_REG, 0x11111111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL0_REG, 0x01010000);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL1_REG, 0x15151111);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL2_REG, 0x57575555);
+	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL3_REG, 0x7f7f7777);
+
+	/* Do dithering if panel only supports 6 bits per color */
+	if (connector->display_info.bpc == 6)
+		val |= SUN4I_TCON0_FRM_CTL_EN;
+
+	if (connector->display_info.num_bus_formats == 1)
+		bus_format = connector->display_info.bus_formats[0];
+
+	/* Check the connection format */
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		/* R and B components are only 5 bits deep */
+		val |= SUN4I_TCON0_FRM_CTL_MODE_R;
+		val |= SUN4I_TCON0_FRM_CTL_MODE_B;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		/* Fall through: enable dithering */
+		val |= SUN4I_TCON0_FRM_CTL_EN;
+		break;
+	}
+
+	/* Write dithering settings */
+	regmap_write(tcon->regs, SUN4I_TCON_FRM_CTL_REG, val);
+}
+
 static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 				     const struct drm_encoder *encoder,
 				     const struct drm_display_mode *mode)
@@ -294,6 +346,9 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
+	/* Set dithering if needed */
+	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
 			   SUN4I_TCON0_CTL_IF_MASK,
 			   SUN4I_TCON0_CTL_IF_8080);
@@ -359,6 +414,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 	tcon->dclk_max_div = 7;
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
+	/* Set dithering if needed */
+	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
@@ -432,6 +490,9 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 	tcon->dclk_max_div = 127;
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
+	/* Set dithering if needed */
+	sun4i_tcon0_mode_set_dithering(tcon, tcon->panel->connector);
+
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
-- 
2.19.0.rc1
