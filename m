From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 5/5] drm/bridge: lvds-encoder: add powerdown-gpios
 support
Date: Tue, 22 Jan 2019 23:01:59 +0200
Message-ID: <20190122210159.GI3264@pendragon.ideasonboard.com>
References: <20181229070649.21308-1-peda@axentia.se>
 <20181229070649.21308-6-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181229070649.21308-6-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Thank you for the patch.

On Sat, Dec 29, 2018 at 07:07:43AM +0000, Peter Rosin wrote:
> Optionally power down the LVDS-encoder when it is not in use.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

As the powerdown-gpios property is only defined for two encoders, and
both of them should work well with this code, I think the change is
fine. In the future if different power-up/down sequences need to be
implemented for different devices this will need to be made
device-specific.

> ---
>  drivers/gpu/drm/bridge/lvds-encoder.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
> index f6770e83d49d..36d8557bc097 100644
> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> +++ b/drivers/gpu/drm/bridge/lvds-encoder.c
> @@ -11,11 +11,13 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_graph.h>
>  
>  struct lvds_encoder {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct gpio_desc *powerdown_gpio;
>  };
>  
>  static int lvds_encoder_attach(struct drm_bridge *bridge)
> @@ -28,8 +30,30 @@ static int lvds_encoder_attach(struct drm_bridge *bridge)
>  				 bridge);
>  }
>  
> +static void lvds_encoder_enable(struct drm_bridge *bridge)
> +{
> +	struct lvds_encoder *lvds_encoder = container_of(bridge,
> +							 struct lvds_encoder,
> +							 bridge);
> +
> +	if (lvds_encoder->powerdown_gpio)
> +		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);

gpiod_set_value_cansleep() already contains a NULL check, so you can
drop it from here.

> +}
> +
> +static void lvds_encoder_disable(struct drm_bridge *bridge)
> +{
> +	struct lvds_encoder *lvds_encoder = container_of(bridge,
> +							 struct lvds_encoder,
> +							 bridge);
> +
> +	if (lvds_encoder->powerdown_gpio)
> +		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);

Same here.

> +}
> +
>  static struct drm_bridge_funcs funcs = {

While at it, could you make this const ?

With these fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	.attach = lvds_encoder_attach,
> +	.enable = lvds_encoder_enable,
> +	.disable = lvds_encoder_disable,
>  };
>  
>  static int lvds_encoder_probe(struct platform_device *pdev)
> @@ -45,6 +69,16 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  	if (!lvds_encoder)
>  		return -ENOMEM;
>  
> +	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> +							       GPIOD_OUT_HIGH);
> +	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
> +		int err = PTR_ERR(lvds_encoder->powerdown_gpio);
> +
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "powerdown GPIO failure: %d\n", err);
> +		return err;
> +	}
> +
>  	/* Locate the panel DT node. */
>  	port = of_graph_get_port_by_id(dev->of_node, 1);
>  	if (!port) {

-- 
Regards,

Laurent Pinchart
