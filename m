From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 07/12] drm/sun4i: sun6i_mipi_dsi: Setup burst mode
Date: Fri, 16 Nov 2018 22:09:11 +0530
Message-ID: <20181116163916.29621-8-jagan@amarulasolutions.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB7XFXPPQKGQEWLYEJZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181116163916.29621-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Setting up burst mode display would require to compute
- Horizontal timing edge values to fill burst drq register
- Line, sync values to fill burst line register

Since there is no direct documentation for these computations
the edge and line formulas are taken from BSP code (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

line_num = panel->lcd_ht*dsi_pixel_bits[panel->lcd_dsi_format]/
	  (8*panel->lcd_dsi_lane);
edge1 = sync_point+(panel->lcd_x+panel->lcd_hbp+20)*
	dsi_pixel_bits[panel->lcd_dsi_format] /(8*panel->lcd_dsi_lane);
edge1 = (edge1>line_num)?line_num:edge1;
edge0 = edge1+(panel->lcd_x+40)*tcon_div/8;
edge0 = (edge0>line_num)?(edge0-line_num):1;

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 72 ++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 66a01061e51d..0182408f8932 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -364,6 +364,41 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
 		     SUN6I_DSI_INST_JUMP_CFG_NUM(1));
 };
 
+static u32 sun6i_dsi_get_edge1(struct sun6i_dsi *dsi,
+			       struct drm_display_mode *mode, u32 sync_point)
+{
+	struct mipi_dsi_device *device = dsi->device;
+	unsigned int bpp = mipi_dsi_pixel_format_to_bpp(device->format);
+	u32 hact_sync_bp;
+
+	/* Horizontal timings duration excluding front porch */
+	hact_sync_bp = (mode->hdisplay + mode->htotal - mode->hsync_start);
+
+	return (sync_point + ((hact_sync_bp + 20) * bpp / (8 * device->lanes)));
+}
+
+static u32 sun6i_dsi_get_edge0(struct sun6i_dsi *dsi,
+			       struct drm_display_mode *mode, u32 edge1)
+{
+	struct sun4i_tcon *tcon = dsi->tcon;
+	unsigned long dclk_rate, dclk_parent_rate, tcon0_div;
+
+	dclk_rate = clk_get_rate(tcon->dclk);
+	dclk_parent_rate = clk_get_rate(clk_get_parent(tcon->dclk));
+	tcon0_div = dclk_parent_rate / dclk_rate;
+
+	return (edge1 + (mode->hdisplay + 40) * tcon0_div / 8);
+}
+
+static u32 sun6i_dsi_get_line_num(struct sun6i_dsi *dsi,
+				  struct drm_display_mode *mode)
+{
+	struct mipi_dsi_device *device = dsi->device;
+	unsigned int bpp = mipi_dsi_pixel_format_to_bpp(device->format);
+
+	return (mode->htotal * bpp / (8 * device->lanes));
+}
+
 static int sun6i_dsi_get_drq(struct sun6i_dsi *dsi,
 			      struct drm_display_mode *mode)
 {
@@ -499,9 +534,32 @@ static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
 static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
 				  struct drm_display_mode *mode)
 {
-	regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG,
-		     SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
-		     SUN6I_DSI_TCON_DRQ_SET(sun6i_dsi_get_drq(dsi, mode)));
+	struct mipi_dsi_device *device = dsi->device;
+	u32 sync_point = 40;
+	u32 line_num = sun6i_dsi_get_line_num(dsi, mode);
+	u32 edge1 = sun6i_dsi_get_edge1(dsi, mode, sync_point);
+	u32 edge0 = sun6i_dsi_get_edge0(dsi, mode, edge1);
+	u32 val;
+
+	if (edge1 > line_num)
+		edge1 = line_num;
+
+	if (edge0 > line_num)
+		edge0 -= line_num;
+	else
+		edge0 = 1;
+
+	regmap_write(dsi->regs, SUN6I_DSI_BURST_DRQ_REG,
+		     SUN6I_DSI_BURST_DRQ_EDGE1(edge1) |
+		     SUN6I_DSI_BURST_DRQ_EDGE0(edge0));
+	regmap_write(dsi->regs, SUN6I_DSI_BURST_LINE_REG,
+		     SUN6I_DSI_BURST_LINE_NUM(line_num) |
+		     SUN6I_DSI_BURST_LINE_SYNC_POINT(sync_point));
+
+	/* enable burst mode */
+	regmap_read(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, &val);
+	val |= SUN6I_DSI_BASIC_CTL_VIDEO_BURST;
+	regmap_write(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, val);
 }
 
 static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
@@ -726,7 +784,13 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 		     SUN6I_DSI_BASIC_CTL1_VIDEO_PRECISION |
 		     SUN6I_DSI_BASIC_CTL1_VIDEO_MODE);
 
-	sun6i_dsi_setup_burst(dsi, mode);
+	regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG,
+		     SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
+		     SUN6I_DSI_TCON_DRQ_SET(sun6i_dsi_get_drq(dsi, mode)));
+
+	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		sun6i_dsi_setup_burst(dsi, mode);
+
 	sun6i_dsi_setup_inst_loop(dsi, mode);
 	sun6i_dsi_setup_format(dsi, mode);
 	sun6i_dsi_setup_timings(dsi, mode);
-- 
2.18.0.321.gffc6fa0e3
