From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/10] drm/sun4i: tcon: Add support for A10 TCON
Date: Tue, 24 Oct 2017 11:01:02 -0500
Message-ID: <20171024160102.fjonpvkykyijxmow@rob-hp-laptop>
References: <20171017121807.2994-1-wens@csie.org>
 <20171017121807.2994-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017121807.2994-3-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 08:17:59PM +0800, Chen-Yu Tsai wrote:
> From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The A10 has two TCONs that are similar to the ones found on other SoCs.
> Like the A31, TCON0 has a register used to mux the TCON outputs to the
> downstream encoders. The bit fields are slightly different.
> 
> Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> [wens-jdAy2FN1RRM@public.gmane.org: Reworked for A10 and fixed up commit message]
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../bindings/display/sunxi/sun4i-drm.txt           |  1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c                  |  3 ++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 | 30 ++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index 46df3b78ae9e..b2c08af73a95 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -86,6 +86,7 @@ The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
>  
>  Required properties:
>   - compatible: value must be either:
> +   * allwinner,sun4i-a10-tcon
>     * allwinner,sun5i-a13-tcon
>     * allwinner,sun6i-a31-tcon
>     * allwinner,sun6i-a31s-tcon
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index b5879d4620d8..b8089ac6feef 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -184,7 +184,8 @@ static bool sun4i_drv_node_is_frontend(struct device_node *node)
>  
>  static bool sun4i_drv_node_is_tcon(struct device_node *node)
>  {
> -	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
> +	return of_device_is_compatible(node, "allwinner,sun4i-a10-tcon") ||
> +		of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||

This would be better written with of_match_node. Since there's already a 
match table in sun4i_tcon.c, it would be better to use it.

Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
