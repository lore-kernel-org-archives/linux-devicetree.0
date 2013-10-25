From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 25 Oct 2013 21:10:06 +0100
Message-ID: <20131025201006.2D999C405AB@trevor.secretlab.ca>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7080935157248535207=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382346813-8449-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Denis Carikli <denis@eukrea.com>, Richard Purdie <rpurdie@rpsys.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7080935157248535207==
Content-Type: text/plain

On Mon, 21 Oct 2013 11:13:33 +0200, Denis Carikli <denis@eukrea.com> wrote:
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Eric Bénard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v3->v4:
> - The default-brightness property is now optional, it defaults to 1 if not set.
> - def_value int becomes an u32.
> - gbl->def_value was set to pdata->def_value in pdata mode to avoid an extra
>   check.
> ---
>  .../bindings/video/backlight/gpio-backlight.txt    |   20 ++++++
>  drivers/video/backlight/gpio_backlight.c           |   69 ++++++++++++++++++--
>  2 files changed, 82 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt b/Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt
> new file mode 100644
> index 0000000..3474d4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt
> @@ -0,0 +1,20 @@
> +gpio-backlight bindings
> +
> +Required properties:
> +  - compatible: "gpio-backlight"
> +  - gpios: describes the gpio that is used for enabling/disabling the backlight
> +     (see GPIO binding[0] for more details).
> +
> +Optional properties:
> +  - default-brightness-level: the default brightness level (can be 0(off) or
> +      1(on) since GPIOs only support theses levels).

Seems odd to call it brightness since it can only be on or off. Why not
call it "default-state" or and empty bool named "default-on"?

Otherwise looks okay to me.

g.

> +
> +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +
> +	backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpio3 4 0>;
> +		default-brightness-level = <0>;
> +	};
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 81fb127..248124d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -13,6 +13,8 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
>  #include <linux/platform_data/gpio_backlight.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -23,6 +25,7 @@ struct gpio_backlight {
>  
>  	int gpio;
>  	int active;
> +	u32 def_value;
>  };
>  
>  static int gpio_backlight_update_status(struct backlight_device *bl)
> @@ -60,6 +63,41 @@ static const struct backlight_ops gpio_backlight_ops = {
>  	.check_fb	= gpio_backlight_check_fb,
>  };
>  
> +static int gpio_backlight_probe_dt(struct platform_device *pdev,
> +				   struct gpio_backlight *gbl)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	enum of_gpio_flags gpio_flags;
> +	int ret;
> +
> +	gbl->fbdev = NULL;
> +	gbl->gpio = of_get_gpio_flags(np, 0, &gpio_flags);
> +
> +	gbl->active = (gpio_flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1;
> +
> +	if (gbl->gpio == -EPROBE_DEFER) {
> +		return ERR_PTR(-EPROBE_DEFER);
> +	} else if (gbl->gpio < 0) {
> +		dev_err(&pdev->dev, "Error: gpios is a required parameter.\n");
> +		return gbl->gpio;
> +	}
> +
> +	ret = of_property_read_u32(np, "default-brightness-level",
> +				   &gbl->def_value);
> +	if (ret < 0) {
> +		/* The property is optional. */
> +		gbl->def_value = 1;
> +	}
> +
> +	if (gbl->def_value > 1) {
> +		dev_warn(&pdev->dev,
> +			"Warning: Invalid default-brightness-level value. Its value can be either 0(off) or 1(on).\n");
> +		gbl->def_value = 1;
> +	}
> +
> +	return 0;
> +}
> +
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct gpio_backlight_platform_data *pdata =
> @@ -67,10 +105,12 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> +	struct device_node *np = pdev->dev.of_node;
>  	int ret;
>  
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "failed to find platform data\n");
> +	if (!pdata && !np) {
> +		dev_err(&pdev->dev,
> +			"failed to find platform data or device tree node.\n");
>  		return -ENODEV;
>  	}
>  
> @@ -79,14 +119,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	gbl->dev = &pdev->dev;
> -	gbl->fbdev = pdata->fbdev;
> -	gbl->gpio = pdata->gpio;
> -	gbl->active = pdata->active_low ? 0 : 1;
> +
> +	if (np) {
> +		ret = gpio_backlight_probe_dt(pdev, gbl);
> +		if (ret)
> +			return ret;
> +	} else {
> +		gbl->fbdev = pdata->fbdev;
> +		gbl->gpio = pdata->gpio;
> +		gbl->active = pdata->active_low ? 0 : 1;
> +		gbl->def_value = pdata->def_value;
> +	}
>  
>  	ret = devm_gpio_request_one(gbl->dev, gbl->gpio, GPIOF_DIR_OUT |
>  				    (gbl->active ? GPIOF_INIT_LOW
>  						 : GPIOF_INIT_HIGH),
> -				    pdata->name);
> +				    pdata ? pdata->name : "backlight");
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "unable to request GPIO\n");
>  		return ret;
> @@ -103,17 +151,24 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return PTR_ERR(bl);
>  	}
>  
> -	bl->props.brightness = pdata->def_value;
> +	bl->props.brightness = gbl->def_value;
> +
>  	backlight_update_status(bl);
>  
>  	platform_set_drvdata(pdev, bl);
>  	return 0;
>  }
>  
> +static struct of_device_id gpio_backlight_of_match[] = {
> +	{ .compatible = "gpio-backlight" },
> +	{ /* sentinel */ }
> +};
> +
>  static struct platform_driver gpio_backlight_driver = {
>  	.driver		= {
>  		.name		= "gpio-backlight",
>  		.owner		= THIS_MODULE,
> +		.of_match_table = of_match_ptr(gpio_backlight_of_match),
>  	},
>  	.probe		= gpio_backlight_probe,
>  };
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--===============7080935157248535207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7080935157248535207==--
