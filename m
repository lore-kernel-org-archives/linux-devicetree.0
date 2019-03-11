From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v8 01/15] drm/sun4i: dsi: Fix video start delay computation
Date: Mon, 11 Mar 2019 19:06:23 +0530
Message-ID: <20190311133637.18334-2-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Vertical video start delay is computed by excluding vertical front
porch value from total vertical timings.

This clearly confirmed from BSP code and here how it computed,

(drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
=> (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
=> (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
   - panel->lcd_y - (panel->lcd_vbp)
=> timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
  			     - panel->lcd_y - panel->lcd_vbp
=> timmings->ver_front_porch

But the current driver is assuming it can exclude vertical front
porch along with vertical sync values from total vertical timings,
which resulting wrong start delay indeed wrong picture rendering
in the panel.

Example: timings, where it produces the issue.
{
	.vdisplay	= 600,
	.vsync_start	= 600 + 12,
	.vsync_end	= 600 + 12 + 2,
	.vtotal		= 600 + 12 + 2 + 21,
}

It produces the desired start delay value as 19 but the correct working
value should be 513.

So, Fix it by computing proper video start delay.

Fixes: 69006ef0ecb1 ("drm/sun4i: dsi: Change the start delay calculation")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 62a508420227..8d6292c0158b 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -364,8 +364,14 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
 static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
 					   struct drm_display_mode *mode)
 {
-	u16 start = clamp(mode->vtotal - mode->vdisplay - 10, 8, 100);
-	u16 delay = mode->vtotal - (mode->vsync_end - mode->vdisplay) + start;
+	u16 delay = mode->vtotal - (mode->vsync_start - mode->vdisplay);
+
+	/**
+	 * BSP comment:
+	 * put start_delay to tcon. set ready sync early to dramfreq,
+	 * so set start_delay 1
+	 */
+	delay += 1;
 
 	if (delay > mode->vtotal)
 		delay = delay % mode->vtotal;
-- 
2.18.0.321.gffc6fa0e3
