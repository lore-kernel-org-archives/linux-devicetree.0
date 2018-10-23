From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 09/15] drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
Date: Tue, 23 Oct 2018 21:20:29 +0530
Message-ID: <20181023155035.9101-10-jagan@amarulasolutions.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023155035.9101-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Accordingly to BPI-M64-bsp DE DSI code Video start delay
can be computed by subtracting total vertical timing with
front porch timing and with adding 1 delay line for TCON.

Video start delay is computed in BPI-M64-bsp code as
linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c

u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
=> (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
=> (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
   - panel->lcd_y - (panel->lcd_vbp)
=> timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
  			     - panel->lcd_y - panel->lcd_vbp
=> timmings->ver_front_porch

So, update the start delay computation accordingly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Add detailed commit message

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 8d154cf2e6d6..6bece492b1f7 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -358,7 +358,17 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
 static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
 					   struct drm_display_mode *mode)
 {
-	return mode->vtotal - (mode->vsync_end - mode->vdisplay) + 1;
+	u32 vfp = mode->vsync_start - mode->vdisplay;
+	u32 start_delay;
+
+	start_delay = mode->vtotal - vfp + 1;
+	if (start_delay > mode->vtotal)
+		start_delay -= mode->vtotal;
+
+	if (!start_delay)
+		start_delay = 1;
+
+	return start_delay;
 }
 
 static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
-- 
2.18.0.321.gffc6fa0e3
