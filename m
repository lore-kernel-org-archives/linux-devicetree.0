From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v6 09/22] drm/sun4i: sun6i_mipi_dsi: Enable
 burst mode HBP, HSA_HSE
Date: Fri, 25 Jan 2019 01:28:47 +0530
Message-ID: <20190124195900.22620-10-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBSFSVDRAKGQEQRUOZ6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190124195900.22620-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Horizontal back porch, sync active and sync end bits are
needed to disable for burst mode panel operations.

So, disable them via dsi base control register.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index a2ad9fa7f8d5..3d7c03161954 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -549,12 +549,17 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	u16 hbp, hfp, hsa, hblk, vblk;
 	size_t bytes;
 	u8 *buffer;
+	u32 val = 0;
 
 	/* Do all timing calculations up front to allocate buffer space */
 
 	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		hbp = hfp = hsa = vblk = 0;
 		hblk = (mode->hdisplay * Bpp);
+
+		regmap_read(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, &val);
+		val |= SUN6I_DSI_BASIC_CTL_HBP_DIS;
+		val |= SUN6I_DSI_BASIC_CTL_HSA_HSE_DIS;
 		goto alloc_buf;
 	}
 
@@ -603,7 +608,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	if (WARN_ON(!buffer))
 		return;
 
-	regmap_write(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, 0);
+	regmap_write(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, val);
 
 	regmap_write(dsi->regs, SUN6I_DSI_SYNC_HSS_REG,
 		     sun6i_dsi_build_sync_pkt(MIPI_DSI_H_SYNC_START,
-- 
2.18.0.321.gffc6fa0e3
