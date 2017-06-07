From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/11] drm: sun4i: add support for the TV
 encoder in H3 SoC
Date: Wed, 7 Jun 2017 11:38:45 +0200
Message-ID: <20170607093845.cu5kk55nj72roysf@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-8-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrw3slyluc5aqqtx"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMET37EQKGQE2BQTHXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170604160149.30230-8-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yrw3slyluc5aqqtx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 05, 2017 at 12:01:45AM +0800, Icenowy Zheng wrote:
> Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
> but has a internal fixed clock divider that divides the TCON1 clock
> (called TVE clock in datasheet) by 11.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Quirk part rewritten.
> 
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 338b9e5bb2a3..b9ff6d5ea67a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -13,6 +13,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  
> @@ -169,14 +170,21 @@ struct tv_mode {
>  	const struct resync_parameters	*resync_params;
>  };
>  
> +struct sun4i_tv_quirks {
> +	int fixed_divider;
> +};
> +
>  struct sun4i_tv {
>  	struct drm_connector	connector;
>  	struct drm_encoder	encoder;
>  
>  	struct clk		*clk;
> +	struct clk		*mod_clk;
>  	struct regmap		*regs;
>  	struct reset_control	*reset;
>  
> +	const struct sun4i_tv_quirks *quirks;
> +
>  	struct sun4i_drv	*drv;
>  };
>  
> @@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
>  	struct sun4i_tcon *tcon = crtc->tcon;
>  	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
>  
> +	if (tv->quirks->fixed_divider) {
> +		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
> +				 tv->quirks->fixed_divider);
> +		mode->crtc_clock *= tv->quirks->fixed_divider;
> +	}
> +

You're not allowed to change the mode in mode_set, and you shouldn't
even change it. The output pixel clock is still 27MHz.

You should implement that using the states, as we discussed already.

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yrw3slyluc5aqqtx--
