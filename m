From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v7 22/23] drm/sun4i: sun6i_mipi_dsi: Fix DSI hfp
 timing value
Date: Fri,  1 Feb 2019 21:12:31 +0530
Message-ID: <20190201154232.10505-23-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBG6S2HRAKGQEVDJEGPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190201154232.10505-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Current driver is calculating hfp maximum value by subtracting
htotal with hsync_end which is front back value, but the
hpp refers to front porch.

Front porch value is calculating by subtracting hsync_start with
hdisplay as per drm_mode timings, and BSP code from BPI-M64-bsp
is eventually following the same.

BPI-M64-bsp is computing hfp as (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

dsi_hbp = (hbp-hspw)*dsi_pixel_bits[format]/8 - (4+2);
dsi_hact = x * dsi_pixel_bits[format]/8;
dsi_hblk = (ht-hspw)*dsi_pixel_bits[format]/8-(4+4+2);
dsi_hfp = dsi_hblk - (4+dsi_hact+2) - (4+dsi_hbp+2);

Example,
u32 fmt = dsi_pixel_bits[format]/8;
=> ((ht-hspw)*fmt - 10) - (6 + x * fmt) - (6 + (hbp-hspw)*fmt - 6)
=> (ht - hspw - x - (hbp - hspw)) * fmt - 16
=> (ht - x - hbp) * fmt - 16
=> (ht - x - (timmings->hor_total_time - timmings->hor_front_porch - x)
* fmt - 16
=> (timmings->hor_total_time - x - timmings->hor_total_time +
timmings->hor_front_porch + x) * fmt - 16
=> timmings->hor_front_porch * fmt - 16

So, update the DSI hfp timing accordingly.

Tested on 2-lane, 4-lane MIPI-DSI LCD panels.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Tested-by: Merlijn Wajer <merlijn-tF0PIh4TN3odnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 780b1906c661..3fbe2132eb6a 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -587,7 +587,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	 */
 #define HFP_PACKET_OVERHEAD	6
 	hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
-		  (mode->htotal - mode->hsync_end) * Bpp - HFP_PACKET_OVERHEAD);
+		  (mode->hsync_start - mode->hdisplay) * Bpp -
+		  HFP_PACKET_OVERHEAD);
 
 	/*
 	 * hblk seems to be the line + porches length.
-- 
2.18.0.321.gffc6fa0e3
