From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 01/15] drm/sun4i: dsi: Fix video start
 delay computation
Date: Mon, 11 Mar 2019 16:37:34 +0100
Message-ID: <20190311153734.izg44ijwqqh2vpxc@flea>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-2-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gkffxe7wlup45xq3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQ4BTLSAKGQETGFLSOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190311133637.18334-2-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gkffxe7wlup45xq3
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Mar 11, 2019 at 07:06:23PM +0530, Jagan Teki wrote:
> Vertical video start delay is computed by excluding vertical front
> porch value from total vertical timings.
> 
> This clearly confirmed from BSP code and here how it computed,
> 
> (drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
> => (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
> => (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
>    - panel->lcd_y - (panel->lcd_vbp)
> => timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
>   			     - panel->lcd_y - panel->lcd_vbp
> => timmings->ver_front_porch
> 
> But the current driver is assuming it can exclude vertical front
> porch along with vertical sync values from total vertical timings,
> which resulting wrong start delay indeed wrong picture rendering
> in the panel.

Same story here: which panel, which datasheet, which "wrong picture
rendering"?

> Example: timings, where it produces the issue.
> {
> 	.vdisplay	= 600,
> 	.vsync_start	= 600 + 12,
> 	.vsync_end	= 600 + 12 + 2,
> 	.vtotal		= 600 + 12 + 2 + 21,
> }

Can you 100% trust those timings?

> It produces the desired start delay value as 19 but the correct working
> value should be 513.
>
> So, Fix it by computing proper video start delay.
> 
> Fixes: 69006ef0ecb1 ("drm/sun4i: dsi: Change the start delay calculation")
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 62a508420227..8d6292c0158b 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -364,8 +364,14 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
>  static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
>  					   struct drm_display_mode *mode)
>  {
> -	u16 start = clamp(mode->vtotal - mode->vdisplay - 10, 8, 100);
> -	u16 delay = mode->vtotal - (mode->vsync_end - mode->vdisplay) + start;
> +	u16 delay = mode->vtotal - (mode->vsync_start - mode->vdisplay);
> +
> +	/**
> +	 * BSP comment:
> +	 * put start_delay to tcon. set ready sync early to dramfreq,
> +	 * so set start_delay 1
> +	 */

That doesn't make any sense to me... What does it mean?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--gkffxe7wlup45xq3--
