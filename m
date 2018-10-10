From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/sun4i: tcon: Support an active-low
 DE signal with RGB interface
Date: Wed, 10 Oct 2018 16:57:36 +0200
Message-ID: <20181010145736.l6zpohvvd4b5qngr@flea>
References: <20181010114134.8211-1-contact@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB25G7DOQKGQEGSXVDWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181010114134.8211-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 01:41:31PM +0200, Paul Kocialkowski wrote:
> Some panels need an active-low data enable (DE) signal for the RGB
> interface. This requires flipping a bit in the TCON0 polarity register
> when setting up the mode for the RGB interface.
> 
> Add a new helper function to match specific bus flags and use it to set
> the polarity inversion bit for the DE signal when required.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 3fb084f802e2..d249a462ec09 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -78,6 +78,24 @@ static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
>  	return -EINVAL;
>  }
>  
> +static bool sun4i_tcon_match_bus_flags(const struct drm_encoder *encoder,
> +				       u32 bus_flags)
> +{
> +	struct drm_connector *connector;
> +	struct drm_display_info *info;
> +
> +	connector = sun4i_tcon_get_connector(encoder);
> +	if (!connector)
> +		return false;
> +
> +	info = &connector->display_info;
> +
> +	if ((info->bus_flags & bus_flags) == bus_flags)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
>  					  bool enabled)
>  {
> @@ -415,6 +433,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
>  }
>  
>  static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> +				     const struct drm_encoder *encoder,
>  				     const struct drm_display_mode *mode)
>  {
>  	unsigned int bp, hsync, vsync;
> @@ -474,8 +493,13 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
>  	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>  		val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
>  
> +	if (sun4i_tcon_match_bus_flags(encoder, DRM_BUS_FLAG_DE_LOW))
> +		val |= SUN4I_TCON0_IO_POL_DE_NEGATIVE;
> +

There's other flags in use in that function, you should also migrate
them (ideally by splitting that new function into a separate patch).

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
