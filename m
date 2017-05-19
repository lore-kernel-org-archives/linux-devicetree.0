From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 02/11] drm: sun4i: add support for H3 mixers
Date: Fri, 19 May 2017 19:47:29 +0200
Message-ID: <20170519174729.q5qk2vqlibzx3zrv@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-3-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2htxhdcagrftz33"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUG77TEAKGQEV6GVQYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170517164354.16399-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f2htxhdcagrftz33
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, May 18, 2017 at 12:43:45AM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> 
> Allwinner H3 SoC has two mixers, one has 1 VI channel and 3 UI channels,
> and the other has 1 VI and 1 UI.
> 
> Add support for these two variants.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index cb193c5f1686..d658a3a8159a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -390,11 +390,29 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
>  	.ui_num = 1,
>  };
>  
> +static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
> +	.vi_num = 1,
> +	.ui_num = 3,
> +};
> +
> +static const struct sun8i_mixer_cfg sun8i_h3_mixer1_cfg = {
> +	.vi_num = 1,
> +	.ui_num = 1,
> +};
> +
>  static const struct of_device_id sun8i_mixer_of_table[] = {
>  	{
>  		.compatible = "allwinner,sun8i-v3s-de2-mixer",
>  		.data = &sun8i_v3s_mixer_cfg,
>  	},
> +	{
> +		.compatible = "allwinner,sun8i-h3-de2-mixer0",
> +		.data = &sun8i_h3_mixer0_cfg
> +	},
> +	{
> +		.compatible = "allwinner,sun8i-h3-de2-mixer1",
> +		.data = &sun8i_h3_mixer1_cfg
> +	},

So the only difference between the two is the number of ui planes?

Why not create a property to give the number then, instead of a
compatible?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--f2htxhdcagrftz33--
