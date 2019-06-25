From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/4] drm/panel: jh057n0090: Add regulator support
Date: Tue, 25 Jun 2019 23:24:19 +0200
Message-ID: <20190625212419.GB20625@ravnborg.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 07:05:19PM +0200, Guido Günther wrote:
> Allow to specify regulators for vcc and iovcc. According to the data
> sheet the panel wants vcc (2.8V) and iovcc (1.8V) and there's no startup
> dependency between the two.
s/jh057n0090/jh057n00900

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  .../drm/panel/panel-rocktech-jh057n00900.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> index b8a069055fbc..f8f6f087b9bc 100644
> --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/regulator/consumer.h>
>  #include <video/display_timing.h>
>  #include <video/mipi_display.h>
>  
> @@ -47,6 +48,8 @@ struct jh057n {
>  	struct drm_panel panel;
>  	struct gpio_desc *reset_gpio;
>  	struct backlight_device *backlight;
> +	struct regulator *vcc;
> +	struct regulator *iovcc;
>  	bool prepared;
>  
>  	struct dentry *debugfs;
> @@ -160,6 +163,8 @@ static int jh057n_unprepare(struct drm_panel *panel)
>  		return 0;
>  
>  	mipi_dsi_dcs_set_display_off(dsi);
> +	regulator_disable(ctx->iovcc);
> +	regulator_disable(ctx->vcc);
>  	ctx->prepared = false;
>  
>  	return 0;
> @@ -174,6 +179,13 @@ static int jh057n_prepare(struct drm_panel *panel)
>  		return 0;
>  
>  	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
> +	ret = regulator_enable(ctx->vcc);
> +	if (ret < 0)
> +		return ret;
> +	ret = regulator_enable(ctx->iovcc);
> +	if (ret < 0)
> +		return ret;
> +
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  	usleep_range(20, 40);
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> @@ -301,6 +313,13 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
>  	if (IS_ERR(ctx->backlight))
>  		return PTR_ERR(ctx->backlight);
>  
> +	ctx->vcc = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(ctx->vcc))
> +		return PTR_ERR(ctx->vcc);
> +	ctx->iovcc = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(ctx->iovcc))
> +		return PTR_ERR(ctx->iovcc);
> +
Consider to write an error message.
The regulators are now mandatory, but they be missing in some device
trees. So it would be good to help them to understand why it fails.

With this considered:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
