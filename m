From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 25/29] drm: sun4i: add quirks for TCON TOP
Date: Mon, 8 Oct 2018 10:51:12 +0200
Message-ID: <20181008085112.mejpwvl3dpu7sopy@flea>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
 <20181007093905.11253-26-jernej.skrabec@siol.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c3donk7cvlzjru3b"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC5V5TOQKGQE27NLJAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181007093905.11253-26-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--c3donk7cvlzjru3b
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sun, Oct 07, 2018 at 11:39:01AM +0200, Jernej Skrabec wrote:
> From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> 
> Some SoCs, such as H6, doesn't have a full-featured TCON TOP.
> 
> Add quirks support for TCON TOP.
> 
> Currently the presence of TCON_TV1 and DSI is controlled via the quirks
> structure.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 43 ++++++++++++++++++++------
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index 37158548b447..ed13233cad88 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -9,11 +9,17 @@
>  #include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
>  #include "sun8i_tcon_top.h"
>  
> +struct sun8i_tcon_top_quirks {
> +	bool has_tcon_tv1;
> +	bool has_dsi;
> +};
> +
>  static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
>  {
>  	return !!of_match_node(sun8i_tcon_top_of_table, node);
> @@ -121,10 +127,13 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct clk_hw_onecell_data *clk_data;
>  	struct sun8i_tcon_top *tcon_top;
> +	const struct sun8i_tcon_top_quirks *quirks;
>  	struct resource *res;
>  	void __iomem *regs;
>  	int ret, i;
>  
> +	quirks = of_device_get_match_data(&pdev->dev);
> +
>  	tcon_top = devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL);
>  	if (!tcon_top)
>  		return -ENOMEM;
> @@ -187,15 +196,23 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>  					     &tcon_top->reg_lock,
>  					     TCON_TOP_TCON_TV0_GATE, 0);
>  
> -	clk_data->hws[CLK_TCON_TOP_TV1] =
> -		sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
> -					     &tcon_top->reg_lock,
> -					     TCON_TOP_TCON_TV1_GATE, 1);
> +	if (quirks->has_tcon_tv1) {
> +		clk_data->hws[CLK_TCON_TOP_TV1] =
> +			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
> +						     &tcon_top->reg_lock,
> +						     TCON_TOP_TCON_TV1_GATE, 1);
> +	} else {
> +		clk_data->hws[CLK_TCON_TOP_TV1] = NULL;
> +	}
>  
> -	clk_data->hws[CLK_TCON_TOP_DSI] =
> -		sun8i_tcon_top_register_gate(dev, "dsi", regs,
> -					     &tcon_top->reg_lock,
> -					     TCON_TOP_TCON_DSI_GATE, 2);
> +	if (quirks->has_dsi) {
> +		clk_data->hws[CLK_TCON_TOP_DSI] =
> +			sun8i_tcon_top_register_gate(dev, "dsi", regs,
> +						     &tcon_top->reg_lock,
> +						     TCON_TOP_TCON_DSI_GATE, 2);
> +	} else {
> +		clk_data->hws[CLK_TCON_TOP_DSI] = NULL;

clk_data has been kzalloc'd so its content is already NULL.

And you shouldn't have brackets for single line blocks.

with that fixed,

Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--c3donk7cvlzjru3b--
