From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 08/12] drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
Date: Thu, 27 Sep 2018 17:18:46 +0530
Message-ID: <20180927114850.24565-9-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Accordingly to BPI-M64-bsp DE DSI code Video start delay
can be computed by subtracting total vertical timing with
front porch timing and with adding 1 delay line for TCON.

This patch simply add the start_delay logic from BPI-M64-bsp,
w/o this new computation, the DSI on A64 encounter vblank time out.

[CRTC:36:crtc-0] vblank wait timed out

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 9918fdb990ff..217db74c6dc3 100644
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
