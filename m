From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: dumb-vga-dac: Support a
 VDD regulator supply
Date: Mon, 31 Oct 2016 01:28:36 -0500
Message-ID: <20161031062836.mnzdprqfezrfkx4g@rob-hp-laptop>
References: <20161029110611.28951-1-wens@csie.org>
 <20161029110611.28951-2-wens@csie.org>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBFWJ3PAAKGQEHKCLUQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161029110611.28951-2-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2016 at 07:06:10PM +0800, Chen-Yu Tsai wrote:
> Some dumb VGA DACs are active components which require external power.
> Add support for specifying a regulator as its power supply.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../bindings/display/bridge/dumb-vga-dac.txt       |  2 ++

For the binding,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

One code comment below...

>  drivers/gpu/drm/bridge/dumb-vga-dac.c              | 35 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> index 003bc246a270..164cbb15f04c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> @@ -16,6 +16,8 @@ graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>  - Video port 0 for RGB input
>  - Video port 1 for VGA output
>  
> +Optional properties:
> +- vdd-supply: Power supply for DAC
>  
>  Example
>  -------
> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> index afec232185a7..59781e031220 100644
> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> @@ -12,6 +12,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -23,6 +24,7 @@ struct dumb_vga {
>  	struct drm_connector	connector;
>  
>  	struct i2c_adapter	*ddc;
> +	struct regulator	*vdd;
>  };
>  
>  static inline struct dumb_vga *
> @@ -124,8 +126,33 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
>  	return 0;
>  }
>  
> +static void dumb_vga_enable(struct drm_bridge *bridge)
> +{
> +	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
> +	int ret;
> +
> +	if (!IS_ERR(vga->vdd)) {

if (IS_ERR())
	return;

...will save some intentation.

> +		ret = regulator_enable(vga->vdd);
> +
> +		if (ret) {
> +			DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
> +			return;
> +		}
> +	}
> +}
> +
> +static void dumb_vga_disable(struct drm_bridge *bridge)
> +{
> +	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
> +
> +	if (!IS_ERR(vga->vdd))
> +		regulator_disable(vga->vdd);
> +}
> +
>  static const struct drm_bridge_funcs dumb_vga_bridge_funcs = {
>  	.attach		= dumb_vga_attach,
> +	.enable		= dumb_vga_enable,
> +	.disable	= dumb_vga_disable,
>  };
>  
>  static struct i2c_adapter *dumb_vga_retrieve_ddc(struct device *dev)
> @@ -169,6 +196,14 @@ static int dumb_vga_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, vga);
>  
> +	vga->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
> +	if (IS_ERR(vga->vdd)) {
> +		ret = PTR_ERR(vga->vdd);
> +		if (ret == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
> +	}
> +
>  	vga->ddc = dumb_vga_retrieve_ddc(&pdev->dev);
>  	if (IS_ERR(vga->ddc)) {
>  		if (PTR_ERR(vga->ddc) == -ENODEV) {
> -- 
> 2.9.3
> 
