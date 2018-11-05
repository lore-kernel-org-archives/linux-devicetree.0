From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 04/10] drm/sun4i: sun6i_mipi_dsi: Setup
 burst mode
Date: Mon, 5 Nov 2018 11:44:36 +0100
Message-ID: <20181105104436.mt7r2ln2lay5sfl5@flea>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
 <20181103100900.30313-5-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lojmyyjyfhxs6yu5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBL56QDPQKGQEF6CUQDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181103100900.30313-5-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lojmyyjyfhxs6yu5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Nov 03, 2018 at 03:38:54PM +0530, Jagan Teki wrote:
> Setting up burst mode display would require to compute
> - Horizontal timing edge values to fill burst drq register
> - Line, sync values to fill burst line register
> 
> Since there is no direct documentation for these computations
> the edge and line formulas are taken from BSP code
> (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> line_num = panel->lcd_ht*dsi_pixel_bits[panel->lcd_dsi_format]/
> 	  (8*panel->lcd_dsi_lane);
> edge1 = sync_point+(panel->lcd_x+panel->lcd_hbp+20)*
> 	dsi_pixel_bits[panel->lcd_dsi_format] /(8*panel->lcd_dsi_lane);
> edge1 = (edge1>line_num)?line_num:edge1;
> edge0 = edge1+(panel->lcd_x+40)*tcon_div/8;
> edge0 = (edge0>line_num)?(edge0-line_num):1;
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 48 +++++++++++++++++++++-----
>  1 file changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 4965b2c71e4c..b6c01891df36 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -375,20 +375,52 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
>  				  struct drm_display_mode *mode)
>  {
>  	struct mipi_dsi_device *device = dsi->device;
> +	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> +	u32 line_num, edge0, edge1, hact_sync_bp;
> +	u32 sync_point, tcon_div;
>  	u32 val = 0;
>  
> -	if ((mode->hsync_start - mode->hdisplay) > 20) {
> -		/* Maaaaaagic */
> -		u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
> +	if (device->mode_flags != MIPI_DSI_MODE_VIDEO_BURST) {
> +		if ((mode->hsync_start - mode->hdisplay) > 20) {
> +			/* Maaaaaagic */
> +			u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
>  
> -		drq *= mipi_dsi_pixel_format_to_bpp(device->format);
> -		drq /= 32;
> +			drq *= Bpp;
> +			drq /= 32;
>  
> -		val = (SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
> -		       SUN6I_DSI_TCON_DRQ_SET(drq));
> +			val = (SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
> +			       SUN6I_DSI_TCON_DRQ_SET(drq));
> +		}
> +
> +		regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG, val);
> +
> +		return;
>  	}

Having functions to compute drq, the line_number and so on would help
the readibility a lot.

> -	regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG, val);
> +	sync_point = 40;
> +	tcon_div = 8;	/* FIXME need to retrive the divider from TCON */

Then do it. Especially since you have exactly 0 guarantee of the
divider being 8.

(also, s/retrive/retrieve/)

> +
> +	line_num = mode->htotal * Bpp / (8 * device->lanes);
> +	/* Horizental timings duration excluding front porch */

Horizontal

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--lojmyyjyfhxs6yu5--
