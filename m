From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/sun4i: tcon: Pass encoder
 instead of using panel for RGB setup
Date: Mon, 5 Nov 2018 09:59:27 +0100
Message-ID: <20181105085927.tvg5vy3oyygw65z6@flea>
References: <20181101200045.6078-1-contact@paulk.fr>
 <20181101200045.6078-2-contact@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uq6r4rci3segdv2m"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6UMQDPQKGQEJCVR6EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181101200045.6078-2-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uq6r4rci3segdv2m
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Nov 01, 2018 at 09:00:39PM +0100, Paul Kocialkowski wrote:
> Features such as dithering and pixel data edge configuration currently
> rely on the panel registered with the TCON driver. However, bridges are
> also supported in addition panels.
> 
> Instead of retrieving the connector from the panel, pass the encoder
> from the calling function, as is done for other interfaces.
> 
> The connector is then retrieved from the encoder with the dedicated
> helper. Even in the case of bridges, the connector is registered with
> the encoder from our driver and is accessible when iterating connectors.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index f949287d926c..262ffb6b0f82 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -478,8 +478,11 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
>  }
>  
>  static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> +				     const struct drm_encoder *encoder,
>  				     const struct drm_display_mode *mode)
>  {
> +	struct drm_connector *connector = sun4i_tcon_get_connector(encoder);
> +	struct drm_display_info display_info = connector->display_info;
>  	unsigned int bp, hsync, vsync;
>  	u8 clk_delay;
>  	u32 val = 0;
> @@ -491,8 +494,7 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
>  	sun4i_tcon0_mode_set_common(tcon, mode);
>  
>  	/* Set dithering if needed */
> -	if (tcon->panel)
> -		sun4i_tcon0_mode_set_dithering(tcon, tcon->panel->connector);
> +	sun4i_tcon0_mode_set_dithering(tcon, connector);
>  
>  	/* Adjust clock delay */
>  	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
> @@ -556,17 +558,11 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
>  	 * Following code is a way to avoid quirks all around TCON
>  	 * and DOTCLOCK drivers.
>  	 */
> -	if (tcon->panel) {
> -		struct drm_panel *panel = tcon->panel;
> -		struct drm_connector *connector = panel->connector;
> -		struct drm_display_info display_info = connector->display_info;
> -
> -		if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> -			clk_set_phase(tcon->dclk, 240);
> +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> +		clk_set_phase(tcon->dclk, 240);
>  
> -		if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> -			clk_set_phase(tcon->dclk, 0);
> -	}
> +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> +		clk_set_phase(tcon->dclk, 0);

You're doing multiple things here: you're changing the function API,
and then moving the display info checks outside of the tcon->panel
condition.

You should do two separate patches for that.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--uq6r4rci3segdv2m--
