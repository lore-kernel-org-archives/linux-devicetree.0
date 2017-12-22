From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 02/12] drm/panel: lvds: Add support for the power-supply property
Date: Fri, 22 Dec 2017 14:09:32 +0200
Message-ID: <2325464.U6vNVgOjSP@avalon>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com> <0c0819bdf88fa948188df95e57a10820a8a4548d.1513854122.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c0819bdf88fa948188df95e57a10820a8a4548d.1513854122.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, plaes@plaes.org, icenowy@aosc.io, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Thursday, 21 December 2017 13:02:28 EET Maxime Ripard wrote:
> A significant number of panels need to power up a regulator in order to
> operate properly. Add support for the power-supply property to enable and
> disable such a regulator whenever needed.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c
> b/drivers/gpu/drm/panel/panel-lvds.c index e2d57c01200b..57e38a9e7ab4
> 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> 
>  #include <drm/drmP.h>
> @@ -39,6 +40,7 @@ struct panel_lvds {
>  	bool data_mirror;
> 
>  	struct backlight_device *backlight;
> +	struct regulator *supply;
> 
>  	struct gpio_desc *enable_gpio;
>  	struct gpio_desc *reset_gpio;
> @@ -69,6 +71,9 @@ static int panel_lvds_unprepare(struct drm_panel *panel)
>  	if (lvds->enable_gpio)
>  		gpiod_set_value_cansleep(lvds->enable_gpio, 0);
> 
> +	if (lvds->supply)
> +		regulator_disable(lvds->supply);
> +
>  	return 0;
>  }
> 
> @@ -76,6 +81,17 @@ static int panel_lvds_prepare(struct drm_panel *panel)
>  {
>  	struct panel_lvds *lvds = to_panel_lvds(panel);
> 
> +	if (lvds->supply) {
> +		int err;
> +
> +		err = regulator_enable(lvds->supply);
> +		if (err < 0) {
> +			dev_err(lvds->dev, "failed to enable supply: %d\n",
> +				err);
> +			return err;
> +		}
> +	}
> +
>  	if (lvds->enable_gpio)
>  		gpiod_set_value_cansleep(lvds->enable_gpio, 1);
> 
> @@ -196,6 +212,13 @@ static int panel_lvds_probe(struct platform_device
> *pdev) if (ret < 0)
>  		return ret;
> 
> +	lvds->supply = devm_regulator_get_optional(lvds->dev, "power");
> +	if (IS_ERR(lvds->supply)) {
> +		ret = PTR_ERR(lvds->supply);
> +		dev_err(lvds->dev, "failed to request regulator: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* Get GPIOs and backlight controller. */
>  	lvds->enable_gpio = devm_gpiod_get_optional(lvds->dev, "enable",
>  						     GPIOD_OUT_LOW);


-- 
Regards,

Laurent Pinchart
